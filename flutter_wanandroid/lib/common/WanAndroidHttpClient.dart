import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/bean/ArticeListItemBean.dart';
import 'package:flutter_wanandroid/bean/BannerBean.dart';
import 'package:flutter_wanandroid/bean/ListBean.dart';
import 'package:flutter_wanandroid/bean/WanAndroidResponse.dart';
import 'package:retrofit/retrofit.dart';
part 'WanAndroidHttpClient.g.dart';

class WanAndroidHttp {
  static Dio _dio;

  static Future<List<BannerBean>> requestBanner() async {
    if (_dio == null) {
      initDio();
    }
    Future<WanAndroidResponse> _response = WanAndroidHttpClient(
      _dio,
    ).requestBanner();

    return _response.then((response) {
      if (response.errorCode == 0) {
        var banners = (response.data as List)
            .map<BannerBean>((item) => BannerBean.fromJson(item))
            .toList();
        return banners;
      } else {
        throw "${response.errorCode},${response.errorMsg}";
      }
    });
  }

  static Future<List<ArticeListItemBean>> requestTop() async {
    if (_dio == null) {
      initDio();
    }
    Future<WanAndroidResponse> _response = WanAndroidHttpClient(
      _dio,
    ).requestTop();
    return _response.then((response) {
      if (response.errorCode == 0) {
        var tops = (response.data as List)
            .map<ArticeListItemBean>(
                (item) => ArticeListItemBean.fromJson(item))
            .toList();
        return tops;
      } else {
        throw "${response.errorCode},${response.errorMsg}";
      }
    });
  }

  static Future<ListBean> requestArticeList(int page) async {
    if (_dio == null) {
      initDio();
    }
    Future<WanAndroidResponse> _response = WanAndroidHttpClient(
      _dio,
    ).requestArticeList(page);
    return _response.then((response) {
      if (response.errorCode == 0) {
        return ListBean.fromJson(response.data);
      } else {
        throw "${response.errorCode},${response.errorMsg}";
      }
    });
  }

  static void initDio() {
    _dio = Dio();
    _dio.interceptors.add(
      LogInterceptor(
        requestHeader: false,
        responseHeader: false,
        responseBody: false,
      ),
    );
  }
}

@RestApi(baseUrl: "https://www.wanandroid.com/")
abstract class WanAndroidHttpClient {
  factory WanAndroidHttpClient(Dio dio, {String baseUrl}) =
      _WanAndroidHttpClient;

  @GET("/banner/json")
  Future<WanAndroidResponse> requestBanner();

  @GET("/article/top/json")
  Future<WanAndroidResponse> requestTop();

  @GET("/article/list/{page}/json")
  Future<WanAndroidResponse> requestArticeList(@Path() int page);
}
