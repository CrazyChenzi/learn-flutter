import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 组件
import '../components/list.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('这是第一个界面'),
      ),
      body: new Center(
        child: new ListCard(),
      ),
    );
  }
}
