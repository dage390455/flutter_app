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
        child: Chip(
          label: Text("chip"),
          avatar: Icon(Icons.add_location),
          onDeleted: () {
            print("delete");
          },
          deleteIcon: Icon(Icons.delete_forever),
          deleteIconColor: Colors.red,
          deleteButtonTooltipMessage: "删除该条",
        ),
      ),
    );
  }
}
