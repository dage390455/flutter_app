import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("textfiled"),
        ),
        body: new TextField(
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10.0),
              icon: new Icon(Icons.call),
              labelText: "请输入你的手机号",
              helperText: "注册时填写的手机号码"),
          onChanged: (String res) {
            print(res);
          },
          onSubmitted: (String str) {
            print("用户提交----:" + str);
          },
        ));
  }
}
