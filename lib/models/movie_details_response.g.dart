// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsResponse(
      id: json['id'] as int?,
      imdbId: json['imdb_id'] as String?,
      adult: json['adult'] as bool?,
      budget: (json['budget'] as num?)?.toDouble(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      homepage: json['homepage'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      revenue: (json['revenue'] as num?)?.toDouble(),
      runtime: json['runtime'] as int?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$MovieDetailsResponseToJson(
        MovieDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'adult': instance.adult,
      'budget': instance.budget,
      'genres': instance.genres,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'homepage': instance.homepage,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'popularity': instance.popularity,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
