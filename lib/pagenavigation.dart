import 'package:flutter/material.dart';

import 'Page2.dart';

String enterRestaurant() {
  return "和朋友进入了一家餐馆";
}

//String waitForDinner() {
//  return "我们的菜来了，我要开始吃饭了";
//}


//使用异步
Future<String> waitForDinner() async {
  return await "我们的菜来了，我要开始吃饭了";
}

String startChat() {
  return "我们朋友聊起家常";
}

String playPhone() {
  return "等了好好久了，我还是玩会手机吧";
}

void main() {
//  print(enterRestaurant());

//  Future<String> waitDinnerFuture = new Future(waitForDinner);
//  waitDinnerFuture.then((str) {
//    print(str);
//  });
//  print(waitForDinner());
//  print(startChat());
//  print(playPhone());

  print(enterRestaurant());
  Future<String> waitDinnerFuture = waitForDinner();
  waitDinnerFuture.then((str) {
    print(str);
  });
  print(startChat());
  print(playPhone());

  runApp(
    new MaterialApp(
      home: new MyApp(),
      routes: <String, WidgetBuilder>{
        '/page2222': (BuildContext c) {
          return new Page2("i am from page1");
        },
        '/page2': (BuildContext context) => new Page2("page2"),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page1"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            //跳转页面返回值
            Future future = Navigator.of(context).pushNamed("/page2222");
            future.then((onValue) {
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text(onValue),
                  ));
            });
          },
          child: new Text("点我跳转"),
          color: Colors.blue,
          highlightColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
