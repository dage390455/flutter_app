import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  IconData myIcon;
  String title;

  MyListItem(this.myIcon, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        border: new Border(
            bottom: new BorderSide(
          color: Colors.grey,
        )),
      ),
      child: new Row(children: <Widget>[
        new Icon(
          myIcon,
          color: Colors.lightBlueAccent,
        ),
        new Expanded(
          child: new Text(
            title,
            textAlign: TextAlign.right,
          ),
        )
      ]),
    );
  }
}
