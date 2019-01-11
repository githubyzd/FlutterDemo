import 'package:json_annotation/json_annotation.dart';

part 'movie_bean.g.dart';


@JsonSerializable()
class MovieBean extends Object {

  @JsonKey(name: 'subjects')
  List<Subjects> subjects;

  MovieBean(this.subjects,);

  factory MovieBean.fromJson(Map<String, dynamic> srcJson) => _$MovieBeanFromJson(srcJson);

}


@JsonSerializable()
class Subjects extends Object{

  @JsonKey(name: 'rate')
  String rate;

  @JsonKey(name: 'cover_x')
  int coverX;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'playable')
  bool playable;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'cover_y')
  int coverY;

  @JsonKey(name: 'is_new')
  bool isNew;

  Subjects(this.rate,this.coverX,this.title,this.url,this.playable,this.cover,this.id,this.coverY,this.isNew,);

  factory Subjects.fromJson(Map<String, dynamic> srcJson) => _$SubjectsFromJson(srcJson);

}


