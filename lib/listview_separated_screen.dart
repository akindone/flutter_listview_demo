import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewSeparatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView.Separated"),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Text("Item $index");
            },
            separatorBuilder: (context, index) {
              return Container(
                color: Colors.grey,
                height: 3,
              );
            },
            itemCount: 100));
  }
}
