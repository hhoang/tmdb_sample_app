import 'package:json_annotation/json_annotation.dart';

part 'production_companies_response.g.dart';

@JsonSerializable()
class ProductionCompaniesResponse {
  ProductionCompaniesResponse({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  int? id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  String? name;
  @JsonKey(name: 'origin_country')
  String? originCountry;


  factory ProductionCompaniesResponse.fromJson(Map<String, dynamic> json) => _$ProductionCompaniesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompaniesResponseToJson(this);
}
