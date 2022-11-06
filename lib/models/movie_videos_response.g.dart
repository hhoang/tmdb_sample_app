// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_videos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideosResponse _$MovieVideosResponseFromJson(Map<String, dynamic> json) =>
    MovieVideosResponse(
      id: json['id'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => VideosResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVideosResponseToJson(
        MovieVideosResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
