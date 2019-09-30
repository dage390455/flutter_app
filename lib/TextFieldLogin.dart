import 'dart:async';
import 'package:flutter/material.dart';
import 'DynamicPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final String mUserName = "userName";

  void onTextClear() {
    setState(() {
      _userNameController.text = "";
      _userPasswordController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    save() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(mUserName, _userNameController.value.text.toString());
    }

    Future<String> get() async {
      var userName;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      userName = prefs.getString(mUserName);
      return userName;
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("textfiled"),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.only(top: 10),
                icon: new Icon(Icons.perm_identity),
                labelText: "请输入用户名",
                helperText: "注册时填写的名字"),
            controller: _userNameController,
          ),
          new TextField(
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.only(top: 10),
                icon: new Icon(Icons.perm_identity),
                labelText: "请输入密码",
                helperText: "登录密码"),
            obscureText: true,
            controller: _userPasswordController,
          ),
          new Builder(builder: (BuildContext context) {
            return new RaisedButton(
              onPressed: () {
                if (_userNameController.text == "wlp" &&
                    _userPasswordController.text == "123456") {
                  //动态路由跳转
                  Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                      (BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                    return new DynamicPage(_userNameController.text.toString());
                  }));

                  Scaffold.of(context)
                      .showSnackBar(new SnackBar(content: new Text("登录成功")));
                } else {
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("登录失败，用户名密码有误"),
//                    action: new SnackBarAction(label: "撤销", onPressed: () {}),
                  ));
                  onTextClear();
                }
              },
              color: Colors.blue,
              highlightColor: Colors.lightBlueAccent,
              disabledColor: Colors.grey,
              child: new Text(
                "登录",
                style: new TextStyle(color: Colors.white),
              ),
            );
          }),
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
      ),
    );
  }
}
