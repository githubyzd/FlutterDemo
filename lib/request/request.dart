import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/bean/discoverModel.dart';
import 'package:flutter_app/bean/todayModel.dart';
import 'package:http/http.dart' as http;


class YYQRequest {
  /// 获取今日 模块的数据
  static Future<TodayResult> requestToday() async {
    final response = await http.get(todayURL);
    final map = jsonDecode(response.body);
    final code = map["code"];
    final _data = map["data"];
    final stateCode = _data["stateCode"];
    final message = _data["message"];
    final result = TodayResult(
      code: code, 
      stateCode: stateCode, 
      message: message,
      dayDataList: List<TodayModel>()
    );
    final _returnData = _data["returnData"];
    final _dayDataList = _returnData["dayDataList"];
    if (_dayDataList.length == 0) {
      return result;
    }
    for (int i = 0; i < _dayDataList.length; i++) {
      final _dayItemDataList = _dayDataList[i]["dayItemDataList"];
      final publish = TodayPublishDate.fromJSON(_dayDataList[i]);
      result.dayDataList.add(publish);
      for (int j = 0; j < _dayItemDataList.length; j++) {
        final _dayItemData = _dayItemDataList[j];
        if (j != _dayItemDataList.length-1) {
          final dayItemData = DayItemData.fromJSON(_dayItemData);
          result.dayDataList.add(dayItemData);
        } else {
          final dayItemData2 = DayItemData2.fromJSON(_dayItemData);
          result.dayDataList.add(dayItemData2);
        }
      }
    }
    return result;
  }

  /// 获取发现模块数据
  static Future<DiscoverResult> requestDiscover() async {
    final response = await http.get(discoverURL);
    final map = jsonDecode(response.body);
    final code = map["code"];
    final _data = map["data"];
    final stateCode = _data["stateCode"];
    final message = _data["message"];
    final result = DiscoverResult(
      code: code, 
      stateCode: stateCode, 
      message: message,
      galleryItems: List<GalleryModel>(),
      categoryList: List<CategoryModel>(),
      comicList: List<ComicModel>()
    );
    final _returnData = _data["returnData"];
    final _galleryItems = _returnData["galleryItems"];
    for (int i = 0; i < _galleryItems.length; i++) {
      final gallery = GalleryModel.fromJSON(_galleryItems[i]);
      result.galleryItems.add(gallery);
    }
    final _comicLists = _returnData["comicLists"];
    for (int i = 0; i < _comicLists.length; i++) {
      if (i == 0) {
        final _comics = _comicLists[i]["comics"];
        for(int j = 0; j < _comics.length; j++) {
          final category = CategoryModel.fromJSON(_comics[j]);
          result.categoryList.add(category);
        }
      } else {
        final comicModel = ComicModel.fromJSON(_comicLists[i]);
        result.comicList.add(comicModel);
      }
    }
    return result;
  }
}

const todayURL = "http://app.u17.com/v3/appV3_3/ios/phone/comic/todayRecommend";
const discoverURL = "http://app.u17.com/v3/appV3_3/ios/phone/comic/getDetectList";