import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewBuildMultiTypeScreen extends StatelessWidget {
  final List<ListItem> items;


  ListViewBuildMultiTypeScreen({this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView.build multi type item"),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              final item = items[index];

              if (item is HeadingItem) {
                return ListTile(
                  title: Text(
                    item.heading,
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              } else if (item is MessageItem) {
                return ListTile(
                  title: Text(item.sender),
                  subtitle: Text(item.body),
                );
              }
            },
            itemCount: items.length));
  }
}
// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
