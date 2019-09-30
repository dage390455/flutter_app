import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/mutilcheck_model.dart';

///传入标题* item集合* 是否单选
class MutilCheck extends StatefulWidget {
  const MutilCheck({
    this.title,
    this.dataList,
    this.isSingle,
  }) : super();

  final List<MutilCheckModel> dataList;
  final bool isSingle;
  final String title;

  ///获取选中的集合
  getSelecedList() {
    List<MutilCheckModel> selectedList = [];

    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i].isChecked) {
        selectedList.add(dataList[i]);
      }
    }

    return selectedList;
  }

  @override
  State<StatefulWidget> createState() {
    return new _mutilCheckState();
  }
}

class _mutilCheckState extends State<MutilCheck> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: new EdgeInsets.fromLTRB(0, 10, 20, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              child: Text(widget.title),
              padding: EdgeInsets.all(16.0),
            ),
            Expanded(
              child: Wrap(
                  children: List.generate(widget.dataList.length, (index) {
                return Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(widget.dataList[index].name),
                      Checkbox(
                          tristate: false,
                          activeColor: Colors.red,
                          value: widget.dataList[index].isChecked,
                          onChanged: (bool bol) {
                            if (widget.isSingle) {
                              for (int i = 0; i < widget.dataList.length; i++) {
                                widget.dataList[i].isChecked = false;
                              }
                            }
                            setState(() {
                              widget.dataList[index].isChecked = bol;
                            });
                          })
                    ],
                  ),
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
