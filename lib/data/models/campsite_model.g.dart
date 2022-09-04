// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campsite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampsiteModel _$CampsiteModelFromJson(Map<String, dynamic> json) =>
    CampsiteModel(
      createdAt: json['createdAt'] as String?,
      label: json['label'] as String,
      photo: json['photo'] as String,
      geoLocation: json['geoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['geoLocation'] as Map<String, dynamic>),
      isCloseToWater: json['isCloseToWater'] as bool?,
      isCampFireAllowed: json['isCampFireAllowed'] as bool?,
      hostLanguages: (json['hostLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pricePerNight: (json['pricePerNight'] as num?)?.toDouble(),
      suitableFor: (json['suitableFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CampsiteModelToJson(CampsiteModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'label': instance.label,
      'photo': instance.photo,
      'geoLocation': instance.geoLocation,
      'isCloseToWater': instance.isCloseToWater,
      'isCampFireAllowed': instance.isCampFireAllowed,
      'hostLanguages': instance.hostLanguages,
      'pricePerNight': instance.pricePerNight,
      'suitableFor': instance.suitableFor,
      'id': instance.id,
    };

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) => GeoLocation(
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GeoLocationToJson(GeoLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };
