import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/tv_bean.dart';
import 'package:flutter_app/page/TvPage.dart';
import 'package:flutter_app/page/Web.dart';
import 'package:flutter_app/utils/UrlsUtil.dart';
import 'package:flutter_app/view/StaticRatingBar.dart';

class TvCategoryPage extends StatefulWidget {
  Choice choice;

  TvCategoryPage(Choice choice) {
    this.choice = choice;
  }

  @override
  _TvCategoryPageState createState() => new _TvCategoryPageState(choice);
}

class _TvCategoryPageState extends State<TvCategoryPage> {
  Choice choice;
  List widgets = [];
  List data = [];
  ScrollController _scrollController = ScrollController();

  _TvCategoryPageState(Choice choice) {
    this.choice = choice;
  }

  @override
  void initState() {
    _loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return RefreshIndicator(
        onRefresh: _refresh,
        child: new GridView.count(
          //滚动方向
          scrollDirection: Axis.vertical,
          //一行多少个
          crossAxisCount: 2,
          controller: _scrollController,
          //条目宽高比
          childAspectRatio: 0.65,
          padding: const EdgeInsets.all(0.0),
          primary: false,
          //左右间隔
          crossAxisSpacing: 0.0,
          //上下间隔
          mainAxisSpacing: 0.0,
          children: _getListData(),
        ),
      );
    }
  }

  _getListData() {
    List<Widget> widgets = [];
    print("_getListData");
    print(data.length);
    for (int i = 0; i < data.length; i++) {
      Subjects item = this.data[i];

      widgets.add(new GestureDetector(
        child: new Card(
          elevation: 4,
          child: new Padding(
            padding: EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 210,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new NetworkImage(item.cover),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.center,//主轴方向
                  children: [
                    getImages(item),
                    new Container(
                      margin: EdgeInsets.only(left: 6),
                      child: new Text(
                        item.title,
                        textAlign: TextAlign.center,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            inherit: false),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: [
                    new StaticRatingBar(
                      size: 10.0,
                      rate: (double.parse(item.rate)) / 2,
                    ),
                    new Text(item.rate,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 14, color: Colors.grey, inherit: false))
                  ],
                ),
              ].toList(),
            ),
          ),
        ),
        onTap: () {
          print('row tapped $i');
          toDetailPage(data[i]);
        },
      ));
    }
    return widgets;
  }

  Widget getImages(Subjects item) {
    if (item.isNew) {
      return new Image(
        image: new AssetImage('assets/images/ic_new.png'),
        width: 14,
        height: 14,
      );
    } else {
      return new Container(height: 0.0, width: 0.0);
    }
  }

  _loadData() async {
    print("加载数据。。。");
    Dio dio = new Dio();
    Response response = await dio.get(UrlsUtils.GET_MOVIES, data: {
      "type": "tv",
      "tag": choice.title,
      "sort": "recommend",
      "page_limit": 20,
      "page_start": 0
    });
    print(response.data);
    TvBean bean = new TvBean.fromJson(response.data);
    setState(() {
      data = bean.subjects;
    });

    print(data.length);
  }

  //下拉刷新
  Future<Null> _refresh() async {
    setState(() {
      data = [];
    });
    Dio dio = new Dio();
    Response response = await dio.get(UrlsUtils.GET_MOVIES, data: {
      "type": "tv",
      "tag": choice.title,
      "sort": "recommend",
      "page_limit": 10,
      "page_start": data.length
    });
    print(response.data);
    TvBean bean = new TvBean.fromJson(response.data);
    setState(() {
      data = bean.subjects;
    });
  }

  Future _getMore() async {
    Dio dio = new Dio();
    Response response = await dio.get(UrlsUtils.GET_MOVIES, data: {
      "type": "tv",
      "tag": choice.title,
      "sort": "recommend",
      "page_limit": 10,
      "page_start": data.length
    });
    print(response.data);
    TvBean bean = new TvBean.fromJson(response.data);
    data.addAll(bean.subjects);
    setState(() {});
  }

  void toDetailPage(Subjects item) {
    print(item.id);
    Navigator.push(
        context,
        new CupertinoPageRoute(
            builder: (context) => new Web(item.title, item.id)));
  }
}
