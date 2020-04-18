import 'package:json_annotation/json_annotation.dart';
part 'ListBean.g.dart';

@JsonSerializable()
class ListBean {
  int curPage;
  List datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  ListBean(this.curPage, this.datas, this.offset, this.over, this.pageCount,
      this.size, this.total);

  factory ListBean.fromJson(Map<String, dynamic> json) =>
      _$ListBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ListBeanToJson(this);
}
// {
//     "curPage": 2,
//     "datas": [
//     ],
//     "offset": 20,
//     "over": false,
//     "pageCount": 396,
//     "size": 20,
//     "total": 7912
// }
