import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadsurfer_code_challenge/bloc/campsites_list_cubit.dart';
import 'package:roadsurfer_code_challenge/presentation/widgets/campsite_item.dart';

/// home page of the application
class HomePage extends StatelessWidget {
  /// constructor
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text("Roadsurfer Campsites"),
        ),
        body: Center(
          child: BlocBuilder<CampsitesListCubit, CampsitesListState>(
            builder: (context, state) {
              if (state is CampsitesListLoadedState) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: state.campsites.length,
                    itemBuilder: (context, index) =>
                        CampsiteItem(campsite: state.campsites[index]),
                  ),
                );
              } else if (state is CampsitesListLoadingState) {
                return const Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    const Text("Something went wrong, please try again",
                        style: TextStyle(fontSize: 20, color: Colors.red)),
                    IconButton(
                      onPressed: () =>
                          BlocProvider.of<CampsitesListCubit>(context)
                              .fetchCampsitesList(),
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.red,
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      );
}
