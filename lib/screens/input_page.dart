import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/gender_content.dart';
import 'package:bmi_calculator/components/item_card.dart';
import 'package:bmi_calculator/components/number_picker.dart';
import 'package:bmi_calculator/components/submit_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { MALE, FEMALE }

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ItemCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    decorColor: selectedGender == Gender.MALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ItemCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    decorColor: selectedGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ItemCard(
              decorColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumericTextStyle,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kGreyColor,
                      thumbColor: kRedColor,
                      overlayColor: kTransRedColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double nVal) {
                        setState(() {
                          height = nVal.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ItemCard(
                    decorColor: kActiveCardColor,
                    cardChild: NumberPicker(
                      text: 'WEIGHT',
                      initialValue: weight,
                      onValueUpdate: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ItemCard(
                    decorColor: kActiveCardColor,
                    cardChild: NumberPicker(
                      text: 'AGE',
                      initialValue: age,
                      onValueUpdate: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SubmitButtonBar(
            text: 'CALCULATE',
            onPressed: () {
              BMICalculator calc =
                  BMICalculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpreation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
