import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'ImageCarousel.dart';
import 'MyListItem.dart';
import 'ZoomableImage.dart';

void main() {
//  debugPaintSizeEnabled = true;

  runApp(new MaterialApp(
    home: new ImageCarousel(
      <ImageProvider>[
        new NetworkImage('https://imgsa.baidu.com/news/q%3D100/sign=eb74892ff7dcd100cb9cfc21428a47be/4afbfbedab64034fa843e124a0c379310a551d01.jpg'),
        new NetworkImage('https://imgsa.baidu.com/news/q%3D100/sign=ad58b8fe07fa513d57aa68de0d6c554c/c75c10385343fbf28ec68b01bf7eca8065388f2d.jpg'),
        new NetworkImage('https://imgsa.baidu.com/news/q%3D100/sign=f7d77ae13587e9504417f76c2039531b/cf1b9d16fdfaaf51b209f49d835494eef01f7a2d.jpg'),
      ],
    ),
//    home: new ZoomableImage(new NetworkImage('https://imgsa.baidu.com/news/q%3D100/sign=eb74892ff7dcd100cb9cfc21428a47be/4afbfbedab64034fa843e124a0c379310a551d01.jpg'),
//        placeholder: const Center(child: const CircularProgressIndicator()),
//        backgroundColor: Colors.white),
    theme:
        new ThemeData(primaryColor: Colors.red, accentColor: Colors.redAccent),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("flutterdemo"),
//        leading: new Icon(Icons.account_circle),
        centerTitle: true,
        elevation: 10,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.blue,
        child: new Icon(Icons.add),
//        child: new Text("点我", style: new TextStyle(color: Colors.black87)),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "http://t2.hddhhn.com/uploads/tu/201612/98/st93.png"))),
                accountName: new Text("flyou"),
                accountEmail: new Text("fangjaylong@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "http://tva2.sinaimg.cn/crop.0.3.707.707.180/a2f7c645jw8f6qvlbp1g7j20js0jrgrz.jpg"),
                )),
            new ListTile(
              leading: new Icon(Icons.refresh),
              title: new Text("刷新"),
            ),
            new ListTile(
              leading: new Icon(Icons.help),
              title: new Text("帮助"),
            )
          ],
        ),
      ),

      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart), title: new Text("购物车")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.message), title: new Text("会话")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text("我的")),
        ],
        fixedColor: Colors.red,
        currentIndex: 1,
      ),

//      persistentFooterButtons: <Widget>[
//        new Icon(Icons.book),
//        new Icon(Icons.book),
//        new Icon(Icons.book),
//        new Icon(Icons.book)
//      ],
//        body: new Center(child: new Icon(Icons.android,size: 100,color: Colors.blue,)));
//        body: new Text(
//            "夜晚走在喧闹的小街上，反而心能更加的平静，"
//            "或许这就是物极必反的缘故吧，"
//            "总喜欢在最吵闹的地方去寻找那一份属于自己的宁静，"
//            "可以不思考所有的困扰，也可以闭着眼睛静听来自远方的人间天堂的呼唤，"
//            "然后在忽明忽暗的灯光下丢弃心中的包袱，和一脸的苦闷，"
//            "再走到起点时，又翻去了一页，也尘封了以往。",
//            style: new TextStyle(
//                fontSize: 20,
//                color: Colors.blue,
//                fontStyle: FontStyle.italic,
//                fontWeight: FontWeight.bold,
//                decoration: TextDecoration.underline,
//                decorationColor: Colors.red),
//            textAlign: TextAlign.center,
//            maxLines: 3));
//        body: new Image.network("http://s1.dwstatic.com/group1/M00/4D/55/f4e01c46608e946b2fade616492d0d76.gif",width: 2000,height: 200,));
//        body: new Image.network("http://i2.chinanews.com/simg/hd/2019/07/13/93ed5f1f5b1f436fa5d2fb8e8991ea6b.jpg",width: 2000,height: 200,));
//        body: new Image.asset("images/cover.jpg",width: 2000,height: 200,));

//        body: new Container(
//            alignment: Alignment.center,
//            margin: const EdgeInsets.all(20),
//            padding: const EdgeInsets.all(20),
//            decoration: new BoxDecoration(
//                image: new DecorationImage(
//                    fit: BoxFit.fill,
//                    image: new ExactAssetImage("images/cover.jpg"))),
//            width: 300,
//            height: 300,
//            child: new Text("content"),
//            transform: new Matrix4.skewX(0.2)));
//        body: new Center(
//          child: new Container(
//            alignment: Alignment.bottomRight,
//            margin: const EdgeInsets.only(top: 10, left: 10),
//            color: Colors.blue,
//            width: 300,
//            height: 300,
//            child: new Container(
//              child: Icon(
//                Icons.android,
//                color: Colors.red,
//              ),
//              padding: const EdgeInsets.all(20),
//              alignment: Alignment.topLeft,
//              width: 100,
//              height: 100,
//              color: Colors.blue[50],
//            ),
//          ),
//        ));

//        body: new Column(
//          children: <Widget>[
//            new MyListItem(Icons.android, "-----"),
//            new Container(
//              padding: const EdgeInsets.all(10.0),
//              decoration: new BoxDecoration(
//                border: new Border(
//                    bottom: new BorderSide(
//                  color: Colors.grey,
//                )),
//              ),
//              child: new Row(children: <Widget>[
//                new Icon(
//                  Icons.chat,
//                  color: Colors.lightBlueAccent,
//                ),
//                new Expanded(
//                  child: new Text(
//                    "消息记录",
//                    textAlign: TextAlign.right,
//                  ),
//                )
//              ]),
//            ),
//            new Container(
//              padding: const EdgeInsets.all(10),
//              decoration: new BoxDecoration(
//                  border: new Border(
//                      bottom: new BorderSide(color: Colors.redAccent))),
//              child: new Row(
//                children: <Widget>[
//                  new Icon(
//                    Icons.android,
//                    color: Colors.redAccent,
//                  ),
//                  new Expanded(
//                      child: new Text(
//                    "红色文案",
//                    textAlign: TextAlign.right,
//                  ))
//                ],
//              ),
//            )
//          ],
//        ));

//      body: new Table(
//        border: new TableBorder.all(color: Colors.green),
//        children: <TableRow>[
//          new TableRow(children: <Widget>[
//            new Text(
//              "姓名",
//              textAlign: TextAlign.center,
//            ),
//            new Text("职位", textAlign: TextAlign.center)
//          ]),
//          new TableRow(children: <Widget>[
//            new Text("flyou", textAlign: TextAlign.center),
//            new Text("终端开发工程师", textAlign: TextAlign.center)
//          ]),
//          new TableRow(children: <Widget>[
//            new Text("张三", textAlign: TextAlign.center),
//            new Text("Java开发工程师", textAlign: TextAlign.center)
//          ]),
//          new TableRow(children: <Widget>[
//            new Text("李四", textAlign: TextAlign.center),
//            new Text("大数据开发工程师", textAlign: TextAlign.center)
//          ]),
//          new TableRow(children: <Widget>[
//            new Text("王五", textAlign: TextAlign.center),
//            new Text("Python数据工程师", textAlign: TextAlign.center)
//          ])
//        ],
//      ),

//      body: new Stack(
//        alignment: Alignment.bottomRight,
//        children: <Widget>[
//          new Icon(
//            Icons.contacts,
//            size: 100,
//            color: Colors.yellow,
//          ),
//          new Icon(Icons.android)
//        ],
//      ),

      body: new IndexedStack(
        index: 0,
        children: <Widget>[
          new Icon(
            Icons.contacts,
            size: 100,
            color: Colors.yellow,
          ),
          new Icon(Icons.android),
        ],
      ),
    );
  }
}
