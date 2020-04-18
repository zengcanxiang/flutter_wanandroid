import 'package:flutter_wanandroid/ui/details/WebPageDetails.dart';

class RoutingTable {
  static String Router_Name_Page_details = "Router_Name_Page_details";

  static var routers = {
    Router_Name_Page_details: (context) => WebPageDetails(),
  };
}
