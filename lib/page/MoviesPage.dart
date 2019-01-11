import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/HomePage.dart';
import 'package:flutter_app/page/MoviesCategoryPage.dart';
import 'package:flutter_app/page/OtherWidget.dart';
import 'package:flutter_app/utils/UrlsUtil.dart';
import 'package:dio/dio.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => new _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
//    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter App'),
          actions: [
            new IconButton( // action button
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
              child: new MoviesCategoryPage(choice),
            );
          }).toList(),
        ),
      ),
    );
  }

  _loadData() async {
    print("加载数据。。。");
    Dio dio = new Dio();
    Response response =
        await dio.get(UrlsUtils.GET_TAG, data: {"type": "movie", "source": ""});
    print(response.data.toString());
  }

  void _toMore() {
    Navigator.push(
        context,
        new CupertinoPageRoute(
            builder: (context) => new OtherWidget()));
  }
}

class Choice {
  const Choice({this.title});

  final String title;
}

List<Choice> choices = const <Choice>[
  const Choice(title: '热门'),
  const Choice(title: '最新'),
  const Choice(title: '经典'),
  const Choice(title: '可播放'),
  const Choice(title: '豆瓣高分'),
  const Choice(title: '冷门佳片'),
  const Choice(title: '华语'),
  const Choice(title: '欧美'),
  const Choice(title: '韩国'),
  const Choice(title: '日本'),
  const Choice(title: '动作'),
  const Choice(title: '喜剧'),
  const Choice(title: '爱情'),
  const Choice(title: '科幻'),
  const Choice(title: '悬疑'),
  const Choice(title: '恐怖'),
  const Choice(title: '文艺'),
];
