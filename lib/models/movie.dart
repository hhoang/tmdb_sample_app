import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {

  Movie({
    this.id,
    this.title,
    this.category,
    this.runtime,
  });

  int? id;
  String? title;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? category;
  int? runtime;
  bool? adult;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  String? overview;
  double? popularity;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  bool? video;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  //images
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

}
