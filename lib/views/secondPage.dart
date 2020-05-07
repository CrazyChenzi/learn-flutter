import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/components/input.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  TextEditingController controller;
  String active = '请在上方input输入相关文字！！!';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('这是第二个界面'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: controller,
              onChanged: _onChanged,
            ),
            new Input(active: active)
          ],
        ),
      ),
    );
  }

  void _onChanged(String value) {
    setState(() {
      active = value;
    });
  }
}
