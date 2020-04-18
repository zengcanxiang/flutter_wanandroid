import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/ArticeListItemBean.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageDetails extends StatelessWidget {
  String link;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    if (args is ArticeListItemBean) {
      this.link = args.link;
    }
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: WebView(
          initialUrl: link,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
