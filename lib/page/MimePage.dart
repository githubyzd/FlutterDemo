import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/MovieDetailPage.dart';
import 'package:flutter_app/page/MoviesCategoryPage.dart';
import 'package:flutter_app/utils/UrlsUtil.dart';
import 'package:dio/dio.dart';

abstract class ProfileModel {}

class ProfileData extends ProfileModel {
  var assetName;
  var title;

  ProfileData({this.assetName, this.title});
}

class ProfileLine extends ProfileModel {}

final datas = [
  ProfileData(assetName: "assets/images/edit.png", title: "我的发布"),
  ProfileLine(),
  ProfileData(assetName: "assets/images/riji.png", title: "我的日记"),
  ProfileLine(),
  ProfileData(assetName: "assets/images/focus.png", title: "我的关注"),
  ProfileLine(),
  ProfileData(assetName: "assets/images/photo.png", title: "相册"),
  ProfileLine(),
  ProfileData(assetName: "assets/images/doulie.png", title: "豆列"),
  ProfileLine(),
  ProfileData(assetName: "assets/images/setting.png", title: "设置"),
  ProfileLine()
];

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: ListView.builder(
        padding: EdgeInsets.only(top: 0.0),
        itemCount: datas.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _generatorProfileHeaderWidget(context);
          } else {
            final model = datas[index - 1];
            if (model is ProfileData) {
              return ListTile(
                leading: Container(
                  width: 20.0,
                  child: Image.asset(model.assetName),
                ),
                title: Text('${model.title}'),
              );
            } else {
              return Container(
                height: 1.0,
                color: Colors.grey[200],
              );
            }
          }
        },
      ),
    );
  }
}

Widget _generatorProfileHeaderWidget(BuildContext context) {
  return Container(
      child: Column(
    children: <Widget>[
      Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 200.0,
          ),
          Column(
            children: <Widget>[
              Container(
                  width: 50.0,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: new Image(
                      image: new AssetImage('assets/images/icon.png'))),
              Text('主人，戳我登录',
                  style: TextStyle(color: Colors.white, fontSize: 15.0))
            ],
          )
        ],
      ),
      Container(
        color: Colors.grey[200],
        height: 10.0,
      )
    ],
  ));
}
