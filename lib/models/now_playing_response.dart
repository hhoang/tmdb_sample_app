import 'package:imdb/models/dates_response.dart';
import 'package:imdb/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'now_playing_response.g.dart';

@JsonSerializable()
class NowPlayingResponse {
  NowPlayingResponse({
    this.page,
    this.dates,
    this.results,
  });

  int? page;
  List<Movie>? results;
  DatesResponse? dates;

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) => _$NowPlayingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NowPlayingResponseToJson(this);

}
