import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:roadsurfer_code_challenge/data/models/campsite_model.dart';

/// Model Convertor
class ModelConverter extends JsonConverter {
  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(
          Response<dynamic> response) =>
      response.copyWith(
        body: fromJsonData<BodyType, InnerType>(response.body),
      );

  /// fromJsonData
  T fromJsonData<T, InnerType>(String jsonData) {
    final dynamic jsonMap = json.decode(jsonData);
    final List<dynamic>? docs = jsonMap;
    if (docs == null) {
      return CampsiteModel.fromJson(jsonMap) as T;
    }
    return docs.map((dynamic e) => CampsiteModel.fromJson(e)).toList() as T;
  }
}
