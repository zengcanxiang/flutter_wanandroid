// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WanAndroidHttpClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WanAndroidHttpClient implements WanAndroidHttpClient {
  _WanAndroidHttpClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://www.wanandroid.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  requestBanner() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/banner/json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = WanAndroidResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  requestTop() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/article/top/json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = WanAndroidResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  requestArticeList(page) async {
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/article/list/$page/json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = WanAndroidResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
