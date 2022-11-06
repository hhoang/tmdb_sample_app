import 'package:json_annotation/json_annotation.dart';

part 'videos_response.g.dart';

@JsonSerializable()
class VideosResponse {

  VideosResponse({
    this.id,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
  });

  String? id;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;

  factory VideosResponse.fromJson(Map<String, dynamic> json) => _$VideosResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VideosResponseToJson(this);
}