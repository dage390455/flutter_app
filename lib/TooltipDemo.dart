import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooltips"),
      ),
      body: Center(
        child: Tooltip(
            message: "点击删除",
            preferBelow: false,
            verticalOffset: 100,
//            padding: EdgeInsets.all(100),
            child: Icon(
              Icons.delete,
              size: 50.0,
            )),
      ),
    );
  }
}
