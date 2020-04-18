// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerBean _$BannerBeanFromJson(Map<String, dynamic> json) {
  return BannerBean(
    json['id'] as int,
    json['desc'] as String,
    json['imagePath'] as String,
    json['title'] as String,
    json['isVisible'] as int,
    json['order'] as int,
    json['type'] as int,
    json['url'] as String,
  );
}

Map<String, dynamic> _$BannerBeanToJson(BannerBean instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.coverImgNetworkPath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
