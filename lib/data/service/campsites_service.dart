import 'package:chopper/chopper.dart';
import 'package:roadsurfer_code_challenge/data/models/campsite_model.dart';
import 'package:roadsurfer_code_challenge/data/models/model_convertor.dart';


part 'campsites_service.chopper.dart';

/// campsites service
@ChopperApi()
abstract class CampsiteService extends ChopperService {
  /// get list of campsites
  @Get(path: "/spots/v1/campsites")
  Future<Response<List<CampsiteModel>>> getCampsites();

  /// campsites service
  static CampsiteService create() {
    final ChopperClient client = ChopperClient(
      baseUrl: 'https://62ed0389a785760e67622eb2.mockapi.io',
      interceptors: <dynamic>[HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: <ChopperService>[
        _$CampsiteService(),
      ],
    );
    return _$CampsiteService(client);
  }
}



