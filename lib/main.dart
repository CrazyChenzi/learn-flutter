import 'package:flutter/material.dart';

// 组件
import './views/firstPage.dart';
import './views/secondPage.dart';
import './views/thirdPage.dart';
import './views/Detail.dart';

void main() => runApp(new MaterialApp(
  home: new MyHomePage(),
  routes: <String, WidgetBuilder> {
    '/detail': (BuildContext context) => new Detail('0')
  },
));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

/// with SingleTickerProviderStateMixin

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.orangeAccent,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(text: '列表', icon: new Icon(Icons.home)),
            new Tab(text: '通知', icon: new Icon(Icons.message)),
            new Tab(text: '我的', icon: new Icon(Icons.cloud))
          ],
        ),
      ),
    );
  }
}
