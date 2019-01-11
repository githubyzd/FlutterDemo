import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/discoverModel.dart';

class CategoryWidget extends StatelessWidget {
  final List<CategoryModel> list;
  final categoryTextStyle = TextStyle(
    color: Colors.grey, 
    fontWeight: FontWeight.bold,
    fontSize: 13.0
  );
  CategoryWidget({Key key, this.list}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: list.map<Widget>((category) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 5.0,
                height: 80.0,
                child: Image(
                  image: CachedNetworkImageProvider(category.cover),
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}