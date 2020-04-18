import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CommonItemWidget extends StatelessWidget {
  String title;
  String content;
  String userName;
  String userLogo;
  String label;
  String coverImagePath;

  CommonItemWidget(this.userName, this.title, this.content,
      {this.userLogo, this.label, this.coverImagePath, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: _buildUserLinear(),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: _buildBody(),
            )
          ],
        ));
  }

  Widget _buildUserLinear() {
    return Row(
      children: <Widget>[
        _buildUserLogo(),
        Text("@$userName"),
        _buildLabel(),
      ],
    );
  }

  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title.trim(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Text(content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      )),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: _buildCover(),
        )
      ],
    );
  }

  Widget _buildLabel() {
    if (label?.isNotEmpty ?? false) {
      return Expanded(
        child: Align(
          alignment: Alignment.topRight,
          child: Text(label),
        ),
      );
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  Widget _buildCover() {
    if (coverImagePath?.isNotEmpty ?? false) {
      return Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: NetworkImage(coverImagePath),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  Widget _buildUserLogo() {
    if (userLogo?.isNotEmpty ?? false) {
      return Container(
        margin: EdgeInsets.only(right: 10),
        child: CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(userLogo),
        ),
      );
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }
}
