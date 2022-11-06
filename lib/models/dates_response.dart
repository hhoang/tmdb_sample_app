
import 'package:json_annotation/json_annotation.dart';

part 'dates_response.g.dart';

@JsonSerializable()
class DatesResponse{

  DatesResponse({this.maximum, this.minimum});
  String? minimum;
  String? maximum;

  factory DatesResponse.fromJson(Map<String, dynamic> json) => _$DatesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DatesResponseToJson(this);
}