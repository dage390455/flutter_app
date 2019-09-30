import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  static const platform = const MethodChannel("com.flyou.test/android");

  void StartActivity() async {
    await platform.invokeMapMethod("StartActivity");
  }

  showToast(String msg) async {
    try {
      await platform.invokeMethod("showToast", {"msg": msg});
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  Future<String> getAndroidTime() async {
    var str;
    try {
      str = await platform.invokeMethod("getAndroidTime");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("platformChannels"),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            child: Text("点我提示"),
            onPressed: () {
              StartActivity();
            },
          ),
          new RaisedButton(
            child: Text("系统时间"),
            onPressed: () {
              getAndroidTime().then((str) {
                showToast(str);
              });
            },
          ),
        ],
      ),
    );
  }
}
