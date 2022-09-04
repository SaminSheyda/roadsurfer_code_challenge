import 'package:flutter/material.dart';
import 'package:roadsurfer_code_challenge/data/models/campsite_model.dart';
import 'package:roadsurfer_code_challenge/data/models/model_convertor.dart';
import 'package:test/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('model convertor test', () {
    ModelConverter converter = ModelConverter();
    late String jsonData;
    setUp(() async {
      jsonData =
          '[{"createdAt":"2022-08-10T08:33:05.032Z","label":"expedita","photo":"http://loremflickr.com/640/480","geoLocation":{},"isCloseToWater":true,"isCampFireAllowed":false,"hostLanguages":["en","de"],"pricePerNight":25168.74,"suitableFor":[],"id":"1"},{"createdAt":"2022-08-09T20:38:11.056Z","label":"minima","photo":"http://loremflickr.com/640/480","geoLocation":{},"isCloseToWater":false,"isCampFireAllowed":false,"hostLanguages":["en","de"],"pricePerNight":1914.6,"suitableFor":[],"id":"2"}]';
    });
    test('model converter convert the data correctly', () {
      List<CampsiteModel> list = converter.fromJsonData(jsonData);
      expect(list.length, 2);
      expect(list.first.label, "expedita");
    });
  });
}
