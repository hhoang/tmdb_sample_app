// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      runtime: json['runtime'] as int?,
    )
      ..originalTitle = json['original_title'] as String?
      ..adult = json['adult'] as bool?
      ..genreIds =
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..originalLanguage = json['original_language'] as String?
      ..overview = json['overview'] as String?
      ..popularity = (json['popularity'] as num?)?.toDouble()
      ..releaseDate = json['release_date'] as String?
      ..video = json['video'] as bool?
      ..voteAverage = (json['vote_average'] as num?)?.toDouble()
      ..voteCount = json['vote_count'] as int?
      ..backdropPath = json['backdrop_path'] as String?
      ..posterPath = json['poster_path'] as String?;

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'category': instance.category,
      'runtime': instance.runtime,
      'adult': instance.adult,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
    };
