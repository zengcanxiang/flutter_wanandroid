// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WanAndroidResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WanAndroidResponse _$WanAndroidResponseFromJson(Map<String, dynamic> json) {
  return WanAndroidResponse(
    json['data'],
    json['errorCode'] as int,
    json['errorMsg'] as String,
  );
}

Map<String, dynamic> _$WanAndroidResponseToJson(WanAndroidResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
