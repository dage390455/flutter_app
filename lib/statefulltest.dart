import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MyHomePage("ttt");
//    return new MyHomePage("teststatefull");
}

class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);

  MyHomePage(this.title);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return new _MyHomepageState();
  }
}

class _MyHomepageState extends State<MyHomePage> {
  int _counter = 0;
  int currentIndex = 0;

  void _increaseConter() {
    setState(() {
//      _counter++;
      currentIndex = new Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
//      body: new Center(
//        child: new Text('$_counter'),

      body: new Center(
          child: new IndexedStack(
        index: currentIndex,
        children: <Widget>[
          new Icon(
            Icons.cloud_download,
            size: 100.0,
            color: Colors.blue,
          ),
          new Icon(
            Icons.error_outline,
            size: 100.0,
            color: Colors.red,
          ),
          new Icon(
            Icons.check_circle,
            size: 100.0,
            color: Colors.green,
          ),
          new Icon(
            Icons.help,
            size: 100.0,
            color: Colors.yellowAccent,
          )
        ],
      )),

//      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _increaseConter,
        child: new Icon(Icons.add),
      ),
    );
  }
}
