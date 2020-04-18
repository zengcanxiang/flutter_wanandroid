import 'package:json_annotation/json_annotation.dart';
part 'WanAndroidResponse.g.dart';

@JsonSerializable()
class WanAndroidResponse {
  dynamic data;
  int errorCode;
  String errorMsg;

  WanAndroidResponse(this.data, this.errorCode, this.errorMsg);

  factory WanAndroidResponse.fromJson(Map<String, dynamic> json) =>
      _$WanAndroidResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WanAndroidResponseToJson(this);
}
