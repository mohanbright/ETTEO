
import 'package:etteo_demo/bloc/wizard_bloc.dart';
import 'package:etteo_demo/bloc/wizard_event.dart';
import 'package:etteo_demo/helpers/screen_aware_size.dart';
import 'package:etteo_demo/pages/widgets/wizard/additional_information_needed.dart';
import 'package:etteo_demo/pages/widgets/wizard/work_to_be_completed.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionalService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WizardBloc _wizardBloc = BlocProvider.of<WizardBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.close),
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              onPressed: () => {
                    _wizardBloc.dispatch(CloseWizard()),
                    Navigator.of(context).pop(),
                  }),
        ],
        leading: new Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: screenAwareSize(20, 40, context),
            ),
            Container(
              padding: EdgeInsets.only(left: screenAwareSize(10, 8, context)),
              child: Align(
                //alignment: Alignment(-0.7, 0.6),
                child: Text(
                  "Is an additional service required?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'SFPro',
                      fontSize: screenAwareSize(22, 44, context)),
                ),
              ),
            ),
            SizedBox(
              height: screenAwareSize(20, 40, context),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: screenAwareSize(50, 100, context),
                  bottom: screenAwareSize(60, 100, context)),
              child: Hero(
                  tag: 'logo',
                  child: Image.asset('assets/images/services.png',
                      width: screenAwareSize(350, 700, context))),
            ),
            SizedBox(
              height: screenAwareSize(20, 40, context),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ButtonTheme(
                  minWidth: screenAwareSize(150, 300, context),
                  child: OutlineButton(
                    child: new Text(
                      "Yes",
                      style: new TextStyle(
                        fontFamily: 'Roboto',
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.green[300],
                    borderSide: BorderSide(
                      color: Color(0xffa6b2c1), //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 1.0, //width of the border
                    ),
                    onPressed: () {
                      /// Redirect to ToBeCompleted
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<WizardBloc>.value(
                            value: _wizardBloc,
                            child: ToBeCompleted(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: screenAwareSize(20, 40, context),
                ),
                ButtonTheme(
                  minWidth: screenAwareSize(150, 300, context),
                  child: OutlineButton(
                    child: new Text(
                      "No",
                      style: new TextStyle(
                        fontFamily: 'Roboto',
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.green[300],
                    borderSide: BorderSide(
                      color: Color(0xffa6b2c1), //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 1.0, //width of the border
                    ),
                    onPressed: () {
                      /// Redirect to AdditionalInformation()
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<WizardBloc>.value(
                            value: _wizardBloc,
                            child: AdditionalInfomation(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}