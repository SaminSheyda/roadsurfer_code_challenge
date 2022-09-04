import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:roadsurfer_code_challenge/bloc/campsites_list_cubit.dart';
import 'package:roadsurfer_code_challenge/data/models/campsite_model.dart';
import 'package:roadsurfer_code_challenge/data/service/campsites_service.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockCampsiteService extends Mock implements CampsiteService {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('CampsitesList cubit', () {
    late CampsitesListCubit campsitesListCubit;
    late MockCampsiteService campsiteService;

    setUp(() async {
      campsiteService = MockCampsiteService();
      campsitesListCubit = CampsitesListCubit(campsiteService);
    });

    test('initial state is correct', () {
      expect(campsitesListCubit.state, const CampsitesListInitialState());
    });

    blocTest<CampsitesListCubit, CampsitesListState>(
      'emits [loading, loaded] when getCampsites calls',
      build: () => campsitesListCubit,
      act: (cubit) => cubit.fetchCampsitesList(),
      setUp: () {
        when(campsiteService.getCampsites).thenAnswer(
          (_) async => Future<Response<List<CampsiteModel>>>.value(
            Response(
              http.Response('', 200),
              [
                CampsiteModel(
                    createdAt: "2022-08-10T03:48:36.792Z",
                    label: "explicabo",
                    photo: "http://loremflickr.com/640/480",
                    geoLocation: GeoLocation(),
                    isCloseToWater: true,
                    isCampFireAllowed: true,
                    hostLanguages: ["en", "de"],
                    pricePerNight: 89791.18,
                    suitableFor: [],
                    id: "10"),
              ],
            ),
          ),
        );
      },
      expect: () => <dynamic>[
        const CampsitesListLoadingState(),
        isA<CampsitesListLoadedState>(),
      ],
    );
  });
}
