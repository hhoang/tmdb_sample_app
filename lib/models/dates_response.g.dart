// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatesResponse _$DatesResponseFromJson(Map<String, dynamic> json) =>
    DatesResponse(
      maximum: json['maximum'] as String?,
      minimum: json['minimum'] as String?,
    );

Map<String, dynamic> _$DatesResponseToJson(DatesResponse instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };
