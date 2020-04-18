import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/bean/HomeBodyBean.dart';
import 'package:flutter_wanandroid/bean/HomeBottomNavigationBean.dart';
import 'package:flutter_wanandroid/ui/home/article/article.dart';
import 'package:flutter_wanandroid/ui/home/chapters.dart';
import 'package:flutter_wanandroid/ui/home/project.dart';
import 'package:flutter_wanandroid/ui/home/tree.dart';

class WanAndroidApp extends StatefulWidget {
  WanAndroidApp({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WanAndroidApp> {
  int _bodySelectIndex = 0;

  List<HomeBodyBean> bodys = [
    HomeBodyBean(
        HomeBootomNaviagtionBean("title1", Icons.home), ArticlePageWidget()),
    HomeBodyBean(HomeBootomNaviagtionBean("title2", Icons.video_call),
        ChaptersPageWidget()),
    HomeBodyBean(
        HomeBootomNaviagtionBean("title3", Icons.phone), ProjectPageWidget()),
    HomeBodyBean(
        HomeBootomNaviagtionBean("title4", Icons.receipt), TreePageWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    var _bottomNavigationBar = BottomNavigationBar(
      items: bodys
          .map((item) => BottomNavigationBarItem(
              title: Text(item.bootomNaviagtionBean.title),
              icon: Icon(item.bootomNaviagtionBean.icon)))
          .toList(),
      currentIndex: _bodySelectIndex,
      onTap: _bottomNavigationItemClick,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blue,
    );

    // 设置统一的状态栏样式
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),
        child: Scaffold(
          body: IndexedStack(
            index: _bodySelectIndex,
            children: bodys.map((item) => item.body).toList(),
          ),
          bottomNavigationBar: _bottomNavigationBar,
        ));
  }

  void _bottomNavigationItemClick(int value) {
    setState(() {
      _bodySelectIndex = value;
    });
  }
}
