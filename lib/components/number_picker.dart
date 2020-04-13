import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'round_button.dart';

class NumberPicker extends StatefulWidget {
  final String text;
  final Function onValueUpdate;
  final int initialValue;

  @override
  _NumberPickerState createState() => _NumberPickerState(initialValue);

  NumberPicker(
      {@required this.text, this.onValueUpdate, this.initialValue = 0});
}

class _NumberPickerState extends State<NumberPicker> {
  _NumberPickerState(int initialValue) {
    value = initialValue;
  }

  int value;

  void updateCallback() {
    if (widget.onValueUpdate != null) {
      widget.onValueUpdate(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumericTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  value--;
                });
                updateCallback();
              },
            ),
            SizedBox(
              width: 5.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  value++;
                });
                updateCallback();
              },
            ),
          ],
        )
      ],
    );
  }
}
