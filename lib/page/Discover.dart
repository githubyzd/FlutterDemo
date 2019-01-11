import 'package:flutter/material.dart';
import 'package:flutter_app/bean/discoverModel.dart';
import 'package:flutter_app/page/Category.dart';
import 'package:flutter_app/page/Comic.dart';
import 'package:flutter_app/view/banner.dart';

import '../request/request.dart';

class DiscoverWidget extends StatefulWidget {
  _DiscoverWidget createState() => _DiscoverWidget();
}
class _DiscoverWidget extends State<DiscoverWidget> {
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: YYQRequest.requestDiscover(),
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasData) {
              return _createDiscoverListView(context, snapshot.data);
            } else {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
        }
      },
    );
  }
}

/// 创建ListView
Widget _createDiscoverListView(BuildContext context, DiscoverResult result) {
  // print("result.galleryItems.length = ${result.galleryItems.length}");
  return ListView.builder(
    padding: EdgeInsets.only(top: 0.0),
    itemCount: 2 + result.comicList.length,
    itemBuilder: (context, index) {
      if (index == 0) {
        final list = result.galleryItems.map<String>((gallery) {
          return gallery.cover;
        }).toList();
        list.add(result.galleryItems[0].cover);
        return BannerWidget(list);
      } else if (index == 1) {
        return CategoryWidget(list: result.categoryList);
      } else {
        final comic = result.comicList[index-2];
        print(index);
        print(comic.comicType);
        print(comic.itemTitle);
        if (comic.comicType == 15) {
          return ComicWidget15(comicModel: comic);
        } else if (comic.comicType == 17) {
          return ComicWidget17(comicModel: comic);
        } else if (comic.comicType == 14) {
          return ComicWidget14(comicModel: comic);
        } else if(comic.comicType == 16 ) {
          return ComicWidget16(comicModel: comic);
        } else {
          return null;
        }
      }
    },
  );
}