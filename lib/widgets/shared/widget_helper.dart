
import 'package:etteo_demo/helpers/screen_aware_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_selectable_text/flutter_selectable_text.dart' as fst;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Padding cardRow(BuildContext context, String titleOne, String descritionOne,
    String titleTwo, String descriptionTwo) {
  return Padding(
    padding: EdgeInsets.only(
        top: screenAwareSize(4, 8, context),
        bottom: screenAwareSize(4, 8, context)),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleText(titleOne, context),
              descriptionText(descritionOne, context)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleText(titleTwo, context),
              descriptionText(descriptionTwo, context)
            ],
          ),
        ),
      ],
    ),
  );
}

Padding orderHeaderText(String text, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: screenAwareSize(5, 10, context),
    ),
    child: fst.SelectableText(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: screenAwareSize(18, 36, context),
          fontWeight: FontWeight.bold),
    ),
  );
}

Padding headerText(String text, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      top: screenAwareSize(12, 24, context),
      left: screenAwareSize(5, 10, context),
    ),
    child: SelectableText(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: screenAwareSize(18, 36, context),
          fontWeight: FontWeight.bold),
    ),
  );
}

SelectableText descriptionText(String text, BuildContext context) {
  return SelectableText(
    text,
    style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: screenAwareSize(14, 28, context),
      color: Colors.black54,
    ),
  );
}

Padding titleText(String text, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: screenAwareSize(6, 12, context)),
    child: Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: screenAwareSize(14, 28, context),
          fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Padding subTitleText(String text, icon, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
        top: screenAwareSize(4, 8, context),
        bottom: screenAwareSize(4, 8, context)),
    child: Row(
      children: <Widget>[
        Icon(
          icon,
          size: screenAwareSize(14, 28, context),
          color: Colors.black54,
        ),
        SizedBox(
          width: screenAwareSize(10, 20, context),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: screenAwareSize(14, 28, context),
            color: Colors.black54,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}
