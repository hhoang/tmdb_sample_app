import 'package:imdb/models/genre_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  MovieDetailsResponse({
    this.id,
    this.imdbId,
    this.adult,
    this.budget,
    this.genres,
    this.posterPath,
    this.backdropPath,
    this.homepage,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.popularity,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  int? id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  bool? adult;
  double? budget;

  List<GenreResponse>? genres;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  String? homepage;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;

  double? revenue;
  int? runtime;
  double? popularity;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) => _$MovieDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}
