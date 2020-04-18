// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticeListItemBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticeListItemBean _$ArticeListItemBeanFromJson(Map<String, dynamic> json) {
  return ArticeListItemBean(
    json['chapterName'] as String,
    json['author'] as String,
    json['chapterId'] as int,
    json['collect'] as bool,
    json['courseId'] as int,
    json['desc'] as String,
    json['fresh'] as bool,
    json['link'] as String,
    json['id'] as int,
    json['publishTime'] as int,
    json['shareDate'] as int,
    (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : TagBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['title'] as String,
    json['type'] as int,
    json['userId'] as int,
    json['visible'] as int,
    json['zan'] as int,
    json['apkLink'] as String,
    json['audit'] as int,
    json['canEdit'] as bool,
    json['descMd'] as String,
    json['envelopePic'] as String,
    json['shareUser'] as String,
    json['superChapterId'] as int,
    json['superChapterName'] as String,
  );
}

Map<String, dynamic> _$ArticeListItemBeanToJson(ArticeListItemBean instance) =>
    <String, dynamic>{
      'apkLink': instance.apkLink,
      'audit': instance.audit,
      'author': instance.author,
      'canEdit': instance.canEdit,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'descMd': instance.descMd,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'id': instance.id,
      'link': instance.link,
      'publishTime': instance.publishTime,
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };
