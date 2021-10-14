import 'package:flutter/material.dart';

class Input {
  String firstNumber;
  String secondNumber;
  bool operator;

  Input({this.firstNumber = '', this.operator = false, this.secondNumber = ''});

  void toggleoperator() {
    operator = true;
    print('primary operator is clicked');
  }

  String setNumber(number) {
    if (operator == false) {
      firstNumber += number.toString();
      print('firstNumber is: $firstNumber');
      return firstNumber;
    } else if (operator == true) {
      secondNumber += number.toString();
      print('secondNumber is: $secondNumber');
      return secondNumber;
    }
    return 'Error';
  }
}

class Math extends ChangeNotifier {
  Input input = Input();

  String getNumber(number) {
    return input.setNumber(number);
  }

  void isOperatorClicked() {
    input.toggleoperator();
  }
}
