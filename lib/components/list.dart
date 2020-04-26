import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class ListCard extends StatefulWidget {
  @override
  ListCardState createState() => new ListCardState();
}

class ListCardState extends State<ListCard> {
  List data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Container(
              padding: new EdgeInsets.all(10.0),
              child: new ListTile(
                subtitle: new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: new Text(
                              data[index]['title'],
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Text('随机数'),
                              new Text(Random().nextInt(100).toString()),
                            ],
                          ),
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new Container(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                            child: new Text('id' + data[index]['id'].toString()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                trailing: new Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
              )),
        );
      },
    );
  }
  getData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();

    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        result = jsonDecode(json);
      } else {
        result = 'ERROR';
      }
    } catch (e) {
      result = 'Failed';
    }
    print(result);

    if (!mounted) return;

    setState(() {
      data = result;
    });
  }
}
