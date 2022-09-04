part of 'campsites_list_cubit.dart';


/// campsites list feature states
abstract class CampsitesListState {
  /// Initialises CampsitesList states.
  const CampsitesListState();
}

/// Initial state.
class CampsitesListInitialState extends CampsitesListState {
  /// Initialises initial state.
  const CampsitesListInitialState();
}

/// Loading state.
class  CampsitesListLoadingState extends CampsitesListState {
  /// Initialises loading state.
  const CampsitesListLoadingState();
}

/// Browse Projects Loaded state.
class  CampsitesListLoadedState extends CampsitesListState {
  /// Initialises loaded state.
  CampsitesListLoadedState(this.campsites);

  /// list of banners
  List<CampsiteModel> campsites;
}

/// Trading error state.
class  CampsitesListErrorState extends CampsitesListState {
  /// Initialises error state.
  const CampsitesListErrorState(this.errorMessage);

  /// Error message.
  final String? errorMessage;
}
