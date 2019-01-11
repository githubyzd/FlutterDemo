import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/OtherWidget.dart';
import 'package:flutter_app/page/TvCategoryPage.dart';

class TvPage extends StatefulWidget {
  @override
  _TvPageState createState() => new _TvPageState();
}

class _TvPageState extends State<TvPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter App'),
          actions: [
            new IconButton(
              // action button
              icon: new Icon(Icons.more_vert),
              onPressed: _toMore,
            ),
          ],
          bottom: new TabBar(
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return new Tab(
                text: choice.title,
              );
            }).toList(),
          ),
        ),
        body: new TabBarView(
          children: choices.map((Choice choice) {
            return new Container(
              padding: const EdgeInsets.all(8.0),
              child: new TvCategoryPage(choice),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _toMore() {
    Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => new OtherWidget()));
  }
}

class Choice {
  const Choice({this.title});

  final String title;
}

List<Choice> choices = const <Choice>[
  const Choice(title: '热门'),
  const Choice(title: '美剧'),
  const Choice(title: '英剧'),
  const Choice(title: '韩剧'),
  const Choice(title: '日剧'),
  const Choice(title: '国产剧'),
  const Choice(title: '港剧'),
  const Choice(title: '日本动画'),
  const Choice(title: '综艺'),
  const Choice(title: '纪录片')
];
