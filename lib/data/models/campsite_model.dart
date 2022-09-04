import 'package:json_annotation/json_annotation.dart';

part 'campsite_model.g.dart';

/// campsite data model
@JsonSerializable()
class CampsiteModel {
  String? createdAt;
  String label;
  String photo;
  GeoLocation? geoLocation;
  bool? isCloseToWater;
  bool? isCampFireAllowed;
  List<String>? hostLanguages;
  double? pricePerNight;
  List<String>? suitableFor;
  String? id;

  CampsiteModel(
      {this.createdAt,
      required this.label,
      required this.photo,
      this.geoLocation,
      this.isCloseToWater,
      this.isCampFireAllowed,
      this.hostLanguages,
      this.pricePerNight,
      this.suitableFor,
      this.id});

  /// factory
  factory CampsiteModel.fromJson(Map<String, dynamic> json) =>
      _$CampsiteModelFromJson(json);

  /// to json
  Map<String, dynamic> toJson() => _$CampsiteModelToJson(this);
}

/// geolocation  data model
@JsonSerializable()
class GeoLocation {
  GeoLocation({this.lat, this.long});

  final double? lat;
  final double? long;

  /// factory
  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);

  /// to json
  Map<String, dynamic> toJson() => _$GeoLocationToJson(this);
}
