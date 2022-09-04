import 'package:chopper/chopper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadsurfer_code_challenge/data/models/campsite_model.dart';
import 'package:roadsurfer_code_challenge/data/service/campsites_service.dart';
part 'campsites_list_state.dart';


/// This class handles the business logic related to List of Campsites
class CampsitesListCubit extends Cubit<CampsitesListState> {
  /// Initialises the cubit with an initial state of `CampsitesListInitialState`
  CampsitesListCubit(this.campsiteService) : super(const CampsitesListInitialState());

  final CampsiteService campsiteService;
  /// fetch data from API
  Future<void> fetchCampsitesList() async {
    emit(const CampsitesListLoadingState());
    List<CampsiteModel>? campsites = <CampsiteModel>[];
    try {
      final Response<List<CampsiteModel>> response =
      await campsiteService.getCampsites();
      campsites = response.body;

      if (campsites != null && campsites.isNotEmpty) {
        emit(CampsitesListLoadedState(campsites));
      } else {
        emit(const CampsitesListErrorState(
            'something went wrong in getting data from API'));
      }
    } catch (e) {
      emit(CampsitesListErrorState(e.toString()));
    }
  }
}
