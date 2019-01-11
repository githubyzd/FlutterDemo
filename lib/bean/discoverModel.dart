abstract class DiscoverModel {}

class DiscoverResult {
  int code;
  int stateCode;
  String message;
  List<GalleryModel> galleryItems;
  List<CategoryModel> categoryList;
  List<ComicModel> comicList;

  DiscoverResult({this.code, this.stateCode, this.message, this.galleryItems, this.categoryList, this.comicList});
}

class GalleryModel extends DiscoverModel {
  int linkType;
  String cover;
  int id;
  String title;
  String content;
  List<_GalleryExt> exts;

  GalleryModel.fromJSON(Map covariant) {
    this.linkType = covariant["linkType"];
    this.cover = covariant["cover"];
    this.id = covariant["id"];
    this.title = covariant["title"];
    this.content = covariant["content"];
    this.exts = List<_GalleryExt>();
    final tempExts = covariant["ext"];
    for (int i = 0; i < tempExts.length; i++) {
      final ext = _GalleryExt.fromJSON(tempExts[i]);
      this.exts.add(ext);
    }
  }
}
class _GalleryExt {
  String key;
  var val;

  _GalleryExt.fromJSON(Map covariant) {
    this.key = covariant["key"];
    this.val = covariant["val"];
  }
}

class CategoryModel extends DiscoverModel {
  var cover;
  var name;
  var argName;
  var argValue;
  var itemTitle;

  CategoryModel.fromJSON(Map covariant) {
    this.cover = covariant["cover"];
    this.name = covariant["name"];
    this.argName = covariant["argName"];
    this.argValue = covariant["argValue"];
    this.itemTitle = covariant["itemTitle"];
  }
}

class ComicModel extends DiscoverModel {
  var titleIconUrl;
  var newTitleIconUrl;
  var itemTitle;
  var description;
  var sortId;
  var argName;
  var argValue;
  var comicType;
  List<ComicItemModel> comics;

  ComicModel.fromJSON(Map covariant) {
    this.titleIconUrl = covariant["titleIconUrl"];
    this.newTitleIconUrl = covariant["newTitleIconUrl"];
    this.itemTitle = covariant["itemTitle"];
    this.description = covariant["description"];
    this.sortId = covariant["sortId"];
    this.argName = covariant["argName"];
    this.argValue = covariant["argValue"];
    this.comicType = covariant["comicType"];
    final _comics = covariant["comics"];
    this.comics = List<ComicItemModel>();
    for (int i = 0; i < _comics.length; i++) {
      final comic = ComicItemModel.fromJSON(_comics[i]);
      this.comics.add(comic);
    }
  }
}

class ComicItemModel {
  var comicId;
  var name;
  var cover;
  var shortDescription;
  var tags;

  ComicItemModel.fromJSON(Map covariant) {
    this.comicId = covariant["comicId"];
    this.name = covariant["name"];
    this.cover = covariant["cover"];
    this.shortDescription = covariant["short_description"];
//    this.tags = covariant["tags"].join(" ").toString();
  }
}