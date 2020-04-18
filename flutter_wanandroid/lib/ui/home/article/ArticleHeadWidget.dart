import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/ArticeListItemBean.dart';
import 'package:flutter_wanandroid/ui/router/RoutingTable.dart';

class ArticleHeadWidget extends StatelessWidget {
  List<ArticeListItemBean> _topArticles;

  ArticleHeadWidget(this._topArticles, {Key key})
      : assert(_topArticles != null),
        super(key: key);

  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildTitle(context);
        }
        return GestureDetector(
          child: _buildBody(context, _topArticles[index - 1]),
          onTap: () => _bodyItemClick(context, index - 1),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Color.fromARGB(245, 246, 250, 255),
          height: 0.5,
          thickness: 0.5,
        );
      },
      itemCount: _topArticles.length + 1,
    );
  }

  Widget _buildBody(BuildContext context, ArticeListItemBean topArticle) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Text(topArticle.title),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 16),
            child: Text(
              "${topArticle.zan}人赞 · ${topArticle.author} · 5小时前",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.vertical_align_top,
            color: Colors.blue,
          ),
          Text(
            "置顶",
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }

  _bodyItemClick(BuildContext context, int index) {
    var bean = _topArticles[index];
    Navigator.of(context).pushNamed(
      RoutingTable.Router_Name_Page_details,
      arguments: bean,
    );
  }
}
