
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadsurfer_code_challenge/bloc/campsites_list_cubit.dart';
import 'package:roadsurfer_code_challenge/bloc/simple_bloc_observer.dart';
import 'package:roadsurfer_code_challenge/data/service/campsites_service.dart';
import 'package:roadsurfer_code_challenge/presentation/pages/home_page.dart';
import 'package:roadsurfer_code_challenge/presentation/pages/splash_page.dart';

void main() {
  // We can set a Bloc's observer to an instance of `SimpleBlocObserver`.
  // This will allow us to handle all transitions and errors in SimpleBlocObserver.
  Bloc.observer = SimpleBlocObserver();
  runApp(
    BlocProvider(
      create: (context) {
        return CampsitesListCubit(CampsiteService.create())..fetchCampsitesList();
      },
      child: const CampsitesApp(),
    ),
  );
}

class CampsitesApp extends StatelessWidget {
  const CampsitesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.routeName,
        routes: <String, WidgetBuilder>{
          HomePage.routeName: (BuildContext context) => const HomePage(),
          SplashPage.routeName: (BuildContext context) => const SplashPage(),
        },
    );
  }
}
