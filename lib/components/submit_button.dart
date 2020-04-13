import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class SubmitButtonBar extends StatelessWidget {
  SubmitButtonBar({@required this.text, @required this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeSubmitButtonStyle,
          ),
        ),
        color: kRedColor,
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
