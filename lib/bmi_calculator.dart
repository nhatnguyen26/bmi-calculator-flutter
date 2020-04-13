import 'dart:math' as math;

class BMICalculator {
  final int weight;
  final int height;

  double _bmi;

  BMICalculator({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / math.pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. It is recommended to start excersing more.';
    } else if (_bmi > 18.5) {
      return 'Your body weight is in the normal range. Keep up what you are doing.';
    } else {
      return 'You have a lower than normal body weight. You can consider higher uptake of nutrition along with proper excersize.';
    }
  }
}
