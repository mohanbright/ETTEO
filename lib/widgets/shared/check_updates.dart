import 'dart:math';

import 'package:etteo_demo/bloc/offline_bloc.dart';
import 'package:etteo_demo/bloc/offline_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CheckUpdates extends StatefulWidget {
  CheckUpdates();

  _CheckUpdatesState createState() => _CheckUpdatesState();
}

class _CheckUpdatesState extends State<CheckUpdates> {
  OfflineBloc _offlineBloc;
  String progressText = '';

  List<String> initializingTexts = <String>[
    'Initializing',
    'Starting the van',
    'Loading the truck'
  ];

  String intializingTextSuffix = ', Please wait...';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _offlineBloc,
        builder: (BuildContext context, OfflineState state) {
          return Wrap(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Icon(
                    Icons.local_shipping,
                    size: 75,
                    color: Colors.blue,
                  ))),
              // Padding(
              //     padding: EdgeInsets.all(20),
              Center(
                  child: SpinKitThreeBounce(
                color: Colors.blue,
                size: 20,
              )),
              // ),
              // child: Image.asset('assets/images/services.png',
              //     width: screenAwareSize(100, 500, context)))),
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    initializingTexts[
                            Random().nextInt(initializingTexts.length)] +
                        intializingTextSuffix,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
