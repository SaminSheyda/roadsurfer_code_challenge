// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campsites_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CampsiteService extends CampsiteService {
  _$CampsiteService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CampsiteService;

  @override
  Future<Response<List<CampsiteModel>>> getCampsites() {
    final $url = '/spots/v1/campsites';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<CampsiteModel>, CampsiteModel>($request);
  }
}
