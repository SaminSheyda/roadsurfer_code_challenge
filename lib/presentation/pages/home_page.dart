import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadsurfer_code_challenge/data/models/campsite_model.dart';
import 'package:roadsurfer_code_challenge/presentation/widgets/campsite_item.dart';

/// home page of the application
class HomePage extends StatelessWidget {
  /// constructor
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(backgroundColor: Colors.greenAccent,title: const Text("Roadsurfer Campsites"),),
        body: Center(
          child: CampsiteItem(
            campsite: CampsiteModel(label: 'Some label', photo: 'http://loremflickr.com/640/480'),
          ),
        ),
      );
}
