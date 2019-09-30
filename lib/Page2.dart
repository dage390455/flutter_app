import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final title;

  Page2(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page2"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text(
              title,
              style: new TextStyle(fontSize: 25.0),
            ),
            onPressed: () {
              //出栈
              Navigator.of(context).pop("我是第二个页面返回的数据：$title");
            }),
      ),
    );
  }
}
