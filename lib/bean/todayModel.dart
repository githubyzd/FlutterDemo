
abstract class TodayModel{}

class TodayResult {
  int code;
  int stateCode;
  String message;
  List<TodayModel> dayDataList;

  TodayResult({this.code, this.stateCode, this.message, this.dayDataList});
}

class TodayPublishDate extends TodayModel {
  String _weekDay;
  String _timeStamp;
  String week;
  String date;

  TodayPublishDate.fromJSON(Map covariant) {
    this._weekDay = covariant["weekDay"];
    this._timeStamp = covariant["timeStamp"];
    final now = DateTime.now();
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(this._timeStamp) * 1000);
    var month = "${date.month}";
    var day = "${date.day}";
    if (date.month < 10) {
      month = "0$month";
    }
    if (date.day < 10) {
      day = "0$day";
    }
    if (now.day == date.day) {
      this.week = "今天";
      this.date = "$month""月""$day""日"" ""${this.week}";
    } else {
      this.week = this._weekDay;
      this.date = "$month""月""$day""日";
    }
  }
}

class DayItemData extends TodayModel {
  int htmlId;
  String comicListTitle;
  int btnColor;
  String cover;
  int dataType;
  String shortDescription;
  String longDescription;
  int threadId;
  int type;
  bool isComicCanRead;
  int comicId;
  String comicName;
  String tags;
  String comicCover;

  DayItemData.fromJSON(Map covariant) {
    this.htmlId = covariant["htmlId"];
    this.comicListTitle = covariant["comicListTitle"];
    this.btnColor = covariant["btnColor"];
    this.cover = covariant["cover"];
    this.dataType = covariant["dataType"];
    this.shortDescription = covariant["shortDescription"];
    this.longDescription = covariant["longDescription"];
    this.threadId = covariant["threadId"];
    this.type = covariant["type"];
    this.isComicCanRead = covariant["isComicCanRead"];
    this.comicId = covariant["comicId"];
    this.comicName = covariant["comicName"];
    this.comicCover = covariant["comicCover"];
    this.tags = covariant["tags"] == null ? "" : covariant["tags"].join(" ");
  }
}

class DayItemData2 extends TodayModel {
  int htmlId;
  String comicListTitle;
  int btnColor;
  String cover;
  int dataType;
  String shortDescription;
  String longDescription;
  int threadId;
  int type;
  List<DayComicItem> list;
  DayItemData2.fromJSON(Map covariant) {
    this.htmlId = covariant["htmlId"];
    this.comicListTitle = covariant["comicListTitle"];
    this.btnColor = covariant["btnColor"];
    this.cover = covariant["cover"];
    this.dataType = covariant["dataType"];
    this.shortDescription = covariant["shortDescription"];
    this.longDescription = covariant["longDescription"];
    this.threadId = covariant["threadId"];
    this.type = covariant["type"];
    list = List<DayComicItem>();
    final _dayComicItemList = covariant["dayComicItemList"];
    for (int i = 0; i < _dayComicItemList.length; i++) {
      final comicItem = DayComicItem.fromJSON(_dayComicItemList[i]);
      list.add(comicItem);
    }
  }
}

class DayComicItem {
  String name;
  int comicId;
  String cover;
  String tags;
  int chapterCount;
  DayComicItem.fromJSON(Map covariant) {
    this.name = covariant["name"];
    this.comicId = covariant["comicId"];
    this.cover = covariant["cover"];
    this.tags = covariant["tags"] == null ? "" : covariant["tags"].join(" ");
    this.chapterCount = covariant["chapterCount"];
  }
}