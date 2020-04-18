import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'package:flutter_wanandroid/bean/ArticeListItemBean.dart';
import 'package:flutter_wanandroid/bean/BannerBean.dart';
import 'package:flutter_wanandroid/bean/ListBean.dart';
import 'package:flutter_wanandroid/common/WanAndroidHttpClient.dart';
import 'package:flutter_wanandroid/ui/home/CommonItemWidget.dart';
import 'package:flutter_wanandroid/ui/home/article/ArticleHeadWidget.dart';
import 'package:flutter_wanandroid/ui/router/RoutingTable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticlePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ArticlePageState();
  }
}

class _ArticlePageState extends State<ArticlePageWidget> {
  ScrollController _scrollController = ScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  double _opacity = 0.0;
  double _expandedHeight = 200;
  ListBean _articeListBean;
  List<ArticeListItemBean> _articesLists = [];

  Future<List<BannerBean>> _bannerRequest;
  Future<List<ArticeListItemBean>> _topArticleRequest;
  Future<ListBean> _articeListRequests;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _opacity = _scrollController.offset / _expandedHeight;
      });
    });
    _bannerRequest = WanAndroidHttp.requestBanner();
    _topArticleRequest = WanAndroidHttp.requestTop();
    _articeListRequests = WanAndroidHttp.requestArticeList(0).then((_listBean) {
      _articeListBean = _listBean;
      setState(() {
        _articesLists = _articeListBean.datas
            .map((json) => ArticeListItemBean.fromJson(json))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          body: Container(
            color: Colors.white,
            child: _buildBody(_articesLists),
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _buildHead(),
            ];
          },
        ),
      ),
    );
  }

  Widget _buildHead() {
    var _head = FutureBuilder<List<BannerBean>>(
      future: _bannerRequest,
      initialData: [],
      builder:
          (BuildContext context, AsyncSnapshot<List<BannerBean>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            var _headBanner = BannerSwiper(
              height: 1,
              width: 1,
              length: snapshot.data.length,
              getwidget: (index) {
                var _item = snapshot.data[index % snapshot.data.length];
                return GestureDetector(
                  child: Image.network(_item.coverImgNetworkPath),
                  onTap: () => _headBannerItenClick(_item),
                );
              },
            );
            return _headBanner;
            break;
          default:
            return Text("加载中");
        }
      },
    );

    return SliverAppBar(
        pinned: true,
        title: Opacity(
          opacity: _opacity,
          child: Text("title"),
        ),
        expandedHeight: _expandedHeight,
        forceElevated: false,
        centerTitle: false,
        flexibleSpace: FlexibleSpaceBar(
          background: _head,
          stretchModes: const <StretchMode>[
            StretchMode.fadeTitle,
          ],
        ));
  }

  Widget _buildBody(List<ArticeListItemBean> _articesLists) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: _articleRefresh,
      onLoading: _articleLoading,
      child: ListView.separated(
        itemCount: _articesLists.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _articeListItemClick(context, index - 1),
            child: _buildItem(context, index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Color.fromARGB(245, 246, 250, 255),
            thickness: 15,
            height: 15,
          );
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == 0) {
      var topFuture = FutureBuilder<List<ArticeListItemBean>>(
        future: _topArticleRequest,
        initialData: [],
        builder: (BuildContext context,
            AsyncSnapshot<List<ArticeListItemBean>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("加载中");
              break;
            case ConnectionState.waiting:
              return Text("加载中");
              break;
            case ConnectionState.active:
              return Text("加载中");
              break;
            case ConnectionState.done:
              return ArticleHeadWidget(snapshot.data);
              break;
          }
        },
      );
      return topFuture;
    }
    var articleBean = _articesLists[index - 1];
    return CommonItemWidget(
      articleBean.author,
      articleBean.title,
      articleBean.desc,
      userLogo:
          "https://user-gold-cdn.xitu.io/2019/5/28/16afe0a2e8276190?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1",
      // coverImagePath:
      //     "https://user-gold-cdn.xitu.io/2020/1/12/16f9a2bac16dc118?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
      label: "${articleBean.chapterName}/${articleBean.superChapterName}",
    );
  }

  void _articleRefresh() async {
    print("_articleRefresh");
    _articeListRequests = WanAndroidHttp.requestArticeList(0).then((_listBean) {
      _articeListBean = _listBean;
      setState(() {
        var _list = _articeListBean.datas
            .map((json) => ArticeListItemBean.fromJson(json))
            .toList();
        _list.removeRange(0, 15);
        _articesLists = _list;
        _refreshController.refreshCompleted();
      });
      return null;
    });
  }

  void _articleLoading() async {
    print("_articleLoading");
    _articeListRequests = WanAndroidHttp.requestArticeList(
      _articeListBean.curPage,
    ).then((_listBean) {
      _articeListBean = _listBean;
      setState(() {
        var _list = _articeListBean.datas
            .map((json) => ArticeListItemBean.fromJson(json))
            .toList();
        _list.removeRange(0, 15);
        _articesLists.addAll(_list);
        _refreshController.loadComplete();
      });
      return null;
    });
  }

  void _headBannerItenClick(BannerBean bean) {
    Fluttertoast.showToast(msg: "点击banner${bean.coverImgNetworkPath}");
  }

  _articeListItemClick(BuildContext context, int index) async {
    var bean = _articesLists[index];
    var result = await Navigator.of(context).pushNamed(
      RoutingTable.Router_Name_Page_details,
      arguments: bean,
    );
  }
}
