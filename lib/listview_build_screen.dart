import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewBuildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView.build"),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) => Text("Item $index"),
//            itemExtent: 30,
            reverse: false,
//            scrollDirection: Axis.horizontal,
            primary: true,
            shrinkWrap: true, // 如果没有设置高度，改为false会报错

            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 50, right: 60, top: 30, bottom: 140),
            itemCount: 100));
  }
}
