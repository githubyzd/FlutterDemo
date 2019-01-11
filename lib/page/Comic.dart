import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/discoverModel.dart';

class ComicWidget15 extends StatelessWidget {
  final ComicModel comicModel;
  ComicWidget15({Key key, this.comicModel}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          _generatorTitleWidget(context, comicModel.itemTitle, comicModel.description),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: 320.0,
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              childAspectRatio: 0.9,
              children: comicModel.comics.map<Widget>((comic) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: CachedNetworkImageProvider(comic.cover),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(comic.name, style: TextStyle(fontSize: 15.0)),
                            Text(comic.shortDescription, style: TextStyle(fontSize: 12.0, color: Colors.grey))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ComicWidget17 extends StatelessWidget {
  final ComicModel comicModel;
  ComicWidget17({Key key, this.comicModel}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          _generatorTitleWidget(context, comicModel.itemTitle, comicModel.description),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Image(image: CachedNetworkImageProvider(comicModel.comics[0].cover)),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(comicModel.comics[0].name)
                        ),
                      )
                    ],
                  ),
                ),
                _generatorCardWidget(context, comicModel.comics.skip(1).toList())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ComicWidget14 extends StatelessWidget {
  final ComicModel comicModel;
  ComicWidget14({Key key, this.comicModel}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          _generatorTitleWidget(context, comicModel.itemTitle, comicModel.description),
          _generatorCardWidget(context, comicModel.comics.take(3).toList()),
          _generatorCardWidget(context, comicModel.comics.getRange(3, comicModel.comics.length).toList())
        ],
      )
    );
  }
}

class ComicWidget16 extends StatelessWidget {
  final ComicModel comicModel;
  ComicWidget16({Key key, this.comicModel}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          _generatorTitleWidget(context, comicModel.itemTitle, ""),
          Container(
            child: Image(
              image: CachedNetworkImageProvider(comicModel.comics[0].cover),
              fit: BoxFit.cover
            ),
          )
        ],
      ),
    );
  }
}


Widget _generatorTitleWidget(BuildContext context, String title, String des) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(""),
        Container(
          padding: EdgeInsets.only(left: 38.0),
          child: Text(title, style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Text(des, style: TextStyle(color: Colors.grey, fontSize: 13.0)),
        ),
      ],
    ),
  );
}

Widget _generatorCardWidget(BuildContext context, List<ComicItemModel> list) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list.map<Widget>((comic){
        return Container(
          width: (MediaQuery.of(context).size.width-20.0) / 3,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: CachedNetworkImageProvider(comic.cover),
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(comic.name, style: TextStyle(fontSize: 15.0)),
                      Text(comic.shortDescription, style: TextStyle(fontSize: 12.0, color: Colors.grey))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}