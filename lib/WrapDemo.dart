import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MutilCheck.dart';

import 'mutilcheck_model.dart';

//List<String> list = ["check11", "check22", "check33", "check44", "check55"];

List<MutilCheckModel> list = [];

void main() {
  for (int i = 0; i < 8; i++) {
    list.add(MutilCheckModel("name==" + i.toString(), false));
  }
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          mutilCheck,
          RaisedButton(
            child: Text("normal"),
            onPressed: () {
              print(mutilCheck.getSelecedList().toString());
            },
          )
        ],
      ),
    );
  }

  MutilCheck mutilCheck = MutilCheck(
    title: "z自动title",
    dataList: list,
    isSingle: true,
  );

  ///获取选中的list
  mutilCheck.getSelecedList();
}
