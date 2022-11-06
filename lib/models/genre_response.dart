

import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse{

  GenreResponse({this.id, this.name});
  int? id;
  String? name;

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}