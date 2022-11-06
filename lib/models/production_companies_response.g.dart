// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_companies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompaniesResponse _$ProductionCompaniesResponseFromJson(
        Map<String, dynamic> json) =>
    ProductionCompaniesResponse(
      id: json['id'] as int?,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompaniesResponseToJson(
        ProductionCompaniesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
