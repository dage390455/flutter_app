import 'dart:async';
import 'package:flutter/material.dart';
import 'DynamicPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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
//用户名输入框的控制器
  TextEditingController _userNameController = new TextEditingController();

//密码输入框的控制器
  TextEditingController _userPasswordController = new TextEditingController();

  void onTextClear() {
    setState(() {
      _userNameController.text = "";
      _userPasswordController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    //使用sharedprefence
    save() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userName", _userNameController.value.text.toString());
    }

    Future<String> get() async {
      var userName;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userName = prefs.getString("userName");
      return userName;
    }
//使用文件
//    Future<String> get _localPath async {
//      final directory = await getApplicationDocumentsDirectory();
//
//      return directory.path;
//    }
//
//    Future<File> get _localFile async {
//      final path = await _localPath;
//      return new File('$path/nameFile.txt');
//    }
//
//    Future<File> save(String name) async {
//      final file = await _localFile;
//      return file.writeAsString(name);
//    }

    return new Builder(builder: (BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: Text("SharedPreferences"),
        ),
        body: Center(
          child: new Builder(builder: (BuildContext context) {
            return new Column(
              children: <Widget>[
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10.0),
                      icon: Icon(Icons.perm_identity),
                      labelText: "请输入用户名",
                      helperText: "注册时填写的名字"),
                ),
                RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("存储"),
                    onPressed: () {
                      save();
                      Scaffold.of(context)
                          .showSnackBar(new SnackBar(content: Text("数据存储成功")));
                    }),
                RaisedButton(
                    color: Colors.greenAccent,
                    child: Text("获取"),
                    onPressed: () {
                      Future<String> userName = get();
                      userName.then((String userName) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("数据获取成功：$userName")));
                      });
                    }),
              ],
            );
          }),
        ),
      );
    });
  }
}
