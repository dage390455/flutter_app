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
  int radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CheckBox"),
      ),
      body: new Center(
        child: new Row(
          children: <Widget>[
            new Radio(
                value: 0,
                groupValue: radioValue,
                onChanged: handleRadioValueChanged),
            new Radio(
                value: 1,
                groupValue: radioValue,
                onChanged: handleRadioValueChanged),
            new Radio(
                value: 2,
                groupValue: radioValue,
                onChanged: handleRadioValueChanged),
            new Radio(
                value: 3,
                groupValue: radioValue,
                onChanged: handleRadioValueChanged)
          ],
        ),
      ),
    );
  }
}

class SwitchState extends State {
  bool isChecked = false;

  void handleCheckState(bool state) {
    setState(() {
      isChecked = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("switch"),
      ),
      body: new Center(
        child: new Switch(value: isChecked, onChanged: handleCheckState),
      ),
    );
  }
}

class SliderState extends State {
  double cur = 99;
  bool _isChecked = false;

  void onSliderChange(double pos) {
    setState(() {
      print(pos);
      cur = pos;
    });
  }

  void onCheckChange(bool isChecked) {
    setState(() {
      _isChecked = isChecked;
    });
  }

  int radioValue = 0;

  void onRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  var isSwitch = true;

  onSwitchChange(bool isChecked) {
    setState(() {
      isSwitch = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Slider"),
      ),
      body: new Column(
        children: <Widget>[
          new Slider(
              label: "进度",
              min: 0,
              max: 100,
              value: cur,
              onChanged: onSliderChange),
          new CheckboxListTile(
            value: _isChecked,
            onChanged: onCheckChange,
            secondary: new Icon(
              Icons.update,
              color: Colors.blueAccent,
            ),
            title: new Text("新版本自动下载"),
            subtitle: new Text("仅在WiFi环境下生效"),
          ),
          new RadioListTile(
            value: 0,
            groupValue: radioValue,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: onRadioValueChanged,
            title: new Text("定时提醒间隔"),
            subtitle: new Text("10分钟"),
            secondary: new Icon(
              Icons.timer,
              color: Colors.blueAccent,
            ),
          ),
          new RadioListTile(
            value: 1,
            groupValue: radioValue,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: onRadioValueChanged,
            title: new Text("定时提醒间隔"),
            subtitle: new Text("30分钟"),
            secondary: new Icon(
              Icons.timer,
              color: Colors.blueAccent,
            ),
          ),
          new RadioListTile(
            value: 2,
            groupValue: radioValue,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: onRadioValueChanged,
            title: new Text("定时提醒间隔"),
            subtitle: new Text("1个小时"),
            secondary: new Icon(
              Icons.timer,
              color: Colors.blueAccent,
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          new SwitchListTile(
            value: isSwitch,
            onChanged: onSwitchChange,
            title: new Text("新消息提醒"),
            secondary: new Icon(
              Icons.message,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
