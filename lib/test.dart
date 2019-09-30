import 'package:flutter/material.dart';

void main() {
//  debugPaintSizeEnabled = true;

  runApp(new MaterialApp(
    home: new MyApp(),
    theme:
        new ThemeData(primaryColor: Colors.red, accentColor: Colors.redAccent),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "test",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(

            onPressed: (){},
            child: Text(
              "Hello world" * 6,
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 25.0, fontFamily: "Courier"),
            ),
          ),
          new RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
