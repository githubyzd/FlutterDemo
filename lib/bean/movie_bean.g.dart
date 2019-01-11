// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieBean _$MovieBeanFromJson(Map<String, dynamic> json) {
  return MovieBean((json['subjects'] as List)
      ?.map((e) =>
          e == null ? null : Subjects.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$MovieBeanToJson(MovieBean instance) =>
    <String, dynamic>{'subjects': instance.subjects};

Subjects _$SubjectsFromJson(Map<String, dynamic> json) {
  return Subjects(
      json['rate'] as String,
      json['cover_x'] as int,
      json['title'] as String,
      json['url'] as String,
      json['playable'] as bool,
      json['cover'] as String,
      json['id'] as String,
      json['cover_y'] as int,
      json['is_new'] as bool);
}

Map<String, dynamic> _$SubjectsToJson(Subjects instance) => <String, dynamic>{
      'rate': instance.rate,
      'cover_x': instance.coverX,
      'title': instance.title,
      'url': instance.url,
      'playable': instance.playable,
      'cover': instance.cover,
      'id': instance.id,
      'cover_y': instance.coverY,
      'is_new': instance.isNew
    };
