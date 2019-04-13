import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewCustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView.custom"),
        ),
        body: ListView.custom(childrenDelegate: CustomSliverChildDelegate()));
  }
}

class CustomSliverChildDelegate extends SliverChildDelegate {
  /// 根据index构造child
  @override
  Widget build(BuildContext context, int index) {
    // KeepAlive将把所有子控件加入到cache，已输入的TextField文字不会消失
    // 仅用于演示
    return index > 100
        ? null
        : KeepAlive(
            keepAlive: true,
            child: TextField(decoration: InputDecoration(hintText: '请输入')));
  }

  /// 决定提供了新的childDelegate是否需要重新build。如与旧的delegate信息不同则应该返回true。
  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) {
    return true;
  }

  /// 提高children的count，当无法精确知道时返回null。
  /// 当 build 返回 null时，它也将需要返回一个非null值
  @override
  int get estimatedChildCount => 100;

  /// 预计最大可滑动高度，如果设置的过小会导致部分child不可见，设置报错
  @override
  double estimateMaxScrollOffset(int firstIndex, int lastIndex,
      double leadingScrollOffset, double trailingScrollOffset) {
    return null;
  }

  /// 完成layout后的回调，可以通过该方法获取即将渲染的视图树包括哪些子控件
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    print('didFinishLayout firstIndex=$firstIndex firstIndex=$lastIndex');
  }
}
