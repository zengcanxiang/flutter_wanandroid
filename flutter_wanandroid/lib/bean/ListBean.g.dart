// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBean _$ListBeanFromJson(Map<String, dynamic> json) {
  return ListBean(
    json['curPage'] as int,
    json['datas'] as List,
    json['offset'] as int,
    json['over'] as bool,
    json['pageCount'] as int,
    json['size'] as int,
    json['total'] as int,
  );
}

Map<String, dynamic> _$ListBeanToJson(ListBean instance) => <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };
