import 'package:imdb/models/videos_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_videos_response.g.dart';

@JsonSerializable()
class MovieVideosResponse{
  MovieVideosResponse({this.id, this.results});

  int? id;
  List<VideosResponse>? results;

  factory MovieVideosResponse.fromJson(Map<String, dynamic> json) => _$MovieVideosResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVideosResponseToJson(this);
}