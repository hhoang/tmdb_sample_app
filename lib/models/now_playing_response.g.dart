// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingResponse _$NowPlayingResponseFromJson(Map<String, dynamic> json) =>
    NowPlayingResponse(
      page: json['page'] as int?,
      dates: json['dates'] == null
          ? null
          : DatesResponse.fromJson(json['dates'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NowPlayingResponseToJson(NowPlayingResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'dates': instance.dates,
    };
