import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/generated/l10n.dart';
import 'package:flutter_wanandroid/ui/router/RoutingTable.dart';
import 'package:flutter_wanandroid/wanandroid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: RoutingTable.routers,
      localizationsDelegates: [
        LocalizationsUtils.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocalizationsUtils.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BackConfirmWidget(pressPaddingTime: 2),
    );
  }
}

class BackConfirmWidget extends StatefulWidget {
  BackConfirmWidget({Key key, this.pressPaddingTime}) : super(key: key);

  final int pressPaddingTime;

  @override
  State<StatefulWidget> createState() {
    return _BackConfirmState();
  }
}

class _BackConfirmState extends State<BackConfirmWidget> {
  DateTime _lastPressTime;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if (_lastPressTime == null ||
            DateTime.now().difference(_lastPressTime) >
                Duration(seconds: widget.pressPaddingTime)) {
          _lastPressTime = DateTime.now();
          Fluttertoast.showToast(msg: "再按一次退出程序");
          return false;
        }
        return true;
      },
      child: WanAndroidApp(),
    );
  }
}
