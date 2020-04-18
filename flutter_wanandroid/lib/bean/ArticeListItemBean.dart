import 'package:flutter_wanandroid/bean/TagBean.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ArticeListItemBean.g.dart';

@JsonSerializable()
class ArticeListItemBean {
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  int publishTime;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<TagBean> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  ArticeListItemBean(
    this.chapterName,
    this.author,
    this.chapterId,
    this.collect,
    this.courseId,
    this.desc,
    this.fresh,
    this.link,
    this.id,
    this.publishTime,
    this.shareDate,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
    this.apkLink,
    this.audit,
    this.canEdit,
    this.descMd,
    this.envelopePic,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
  );

  factory ArticeListItemBean.fromJson(Map<String, dynamic> json) =>
      _$ArticeListItemBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ArticeListItemBeanToJson(this);
}

// {
//         "apkLink": "",
//         "audit": 1,
//         "author": "",
//         "canEdit": false,
//         "chapterId": 304,
//         "chapterName": "基础源码",
//         "collect": false,
//         "courseId": 13,
//         "desc": "",
//         "descMd": "",
//         "envelopePic": "",
//         "fresh": false,
//         "id": 11528,
//         "link": "https://juejin.im/entry/5e1d72a4f265da3df245dc1d",
//         "niceDate": "2020-01-16 21:37",
//         "niceShareDate": "2020-01-16 08:51",
//         "origin": "",
//         "prefix": "",
//         "projectLink": "",
//         "publishTime": 1579181855000,
//         "selfVisible": 0,
//         "shareDate": 1579135912000,
//         "shareUser": "goweii",
//         "superChapterId": 245,
//         "superChapterName": "Java深入",
//         "tags": [],
//         "title": "Android进阶之路&mdash;&mdash;Serializable序列化",
//         "type": 0,
//         "userId": 20382,
//         "visible": 1,
//         "zan": 0
//     }
