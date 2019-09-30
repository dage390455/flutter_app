import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new GridApp(),
    ),
  );
}
//builder方式实现

class GridApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new GridState();
  }
}

class GridState extends State<GridApp> {
  final List<ListItem> listData = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      listData.add(new ListItem("我是测试标题$i", Icons.cake));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("grid"),
      ),
      body: new GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0),
          itemBuilder: (BuildContext context, int index) {
            return new GridItemWidget(listData[index]);
          }),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final ListItem listItem;

  GridItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        child: new Container(
          color: Colors.blue,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(listItem.iconData, size: 50.0),
              new Text(listItem.title)
            ],
          ),
        ),
        onTap: () {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text(listItem.title),
          ));
        });
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("gridview"),
      ),
      body: new GridView(
          children: <Widget>[
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            ),
            new Container(
              child: new Icon(
                Icons.cake,
                size: 50.0,
              ),
              color: Colors.blue,
            )
          ],
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0)),
    );
  }
}
