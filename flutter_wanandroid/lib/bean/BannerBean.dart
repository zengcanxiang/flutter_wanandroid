import 'package:json_annotation/json_annotation.dart';
part 'BannerBean.g.dart';

@JsonSerializable()
class BannerBean {
  String desc;
  int id;
  @JsonKey(name: "imagePath")
  String coverImgNetworkPath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  BannerBean(this.id, this.desc, this.coverImgNetworkPath, this.title,
      this.isVisible, this.order, this.type, this.url);

  factory BannerBean.fromJson(Map<String, dynamic> json) =>
      _$BannerBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BannerBeanToJson(this);
}

// {
//     "desc": "享学~",
//     "id": 29,
//     "imagePath": "https://www.wanandroid.com/blogimgs/74a84e45-7f93-476d-bc85-446e1d118b6f.png",
//     "isVisible": 1,
//     "order": 0,
//     "title": "学不动了，也得学&hellip;",
//     "type": 0,
//     "url": "https://mp.weixin.qq.com/s/SJPSMv1elas9hWQ0KtpUaA"
// }
