import 'package:flutter/material.dart';
import 'package:flutter_demo_listview/listview_build_multi_type_screen.dart';
import 'package:flutter_demo_listview/listview_build_screen.dart';
import 'package:flutter_demo_listview/listview_custom_screen.dart';
import 'package:flutter_demo_listview/listview_separated_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/listview_build': (context) => ListViewBuildScreen(),
        '/listview_build_multi': (context) => ListViewBuildMultiTypeScreen(
                items: List<ListItem>.generate(
              1000,
              (i) => i % 6 == 0
                  ? HeadingItem("Heading $i")
                  : MessageItem("Sender $i", "Message body $i"),
            )),
        '/listview_separate': (context) => ListViewSeparatedScreen(),
        '/listview_custom': (context) => ListViewCustomScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(title: Text("普通ListView")),
            ListTile(
                title: Text("ListView.build"),
                onTap: () {
                  Navigator.pushNamed(context, '/listview_build');
                }),
            ListTile(
                title: Text("ListView.buildMultiTypeItem"),
                onTap: () {
                  Navigator.pushNamed(context, '/listview_build_multi');
                }),
            ListTile(
                title: Text("ListView.seperate"),
                onTap: () {
                  Navigator.pushNamed(context, '/listview_separate');
                }),
            ListTile(
                title: Text("ListView.suctom"),
                onTap: () {
                  Navigator.pushNamed(context, '/listview_custom');
                }),
          ],
        ));
  }
}
