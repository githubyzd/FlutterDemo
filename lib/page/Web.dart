import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Web extends StatelessWidget {
  String title;
  String id;

  Web(String title,String id){
    this.title = title;
    this.id = id;
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: 'https://m.douban.com/movie/subject/' + id,
      appBar: AppBar(
        title: Text(title),
      ),
      withZoom: true,
      withLocalStorage: true,
    );
  }
}
