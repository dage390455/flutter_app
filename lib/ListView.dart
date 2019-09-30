import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(home: new MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyListViewState();
  }
}

class MyListViewState extends State<MyApp> {
  List<ListItem> mdata = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 20; i++) {
      mdata.add(new ListItem("我是测试标题$i", Icons.cake));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("ListView")),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new ListItemWidget(mdata[index]);
        },
        itemCount: mdata.length,
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  ListItem item;

  ListItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Icon(item.iconData),
      title: new Text(item.title),
    );
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}
