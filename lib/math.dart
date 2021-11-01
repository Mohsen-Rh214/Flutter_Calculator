import 'package:flutter/material.dart';

class Numbers {
  String firstNumber;
  String secondNumber;
  bool operator;
  String operatorAction;
  double result;

  Numbers({
    this.firstNumber = '',
    this.operator = false,
    this.secondNumber = '',
    this.operatorAction = '',
    this.result = 0,
  });

  void operatorIsClicked(operator) {
    operator = true;
    switch (operatorAction) {
      case '+':
        result = double.parse(firstNumber) + double.parse(secondNumber);
        print('sum is : $result');
        break;
      case '-':
        result = double.parse(firstNumber) - double.parse(secondNumber);
        print('sub is : $result');
        break;
      case '×':
        result = double.parse(firstNumber) * double.parse(secondNumber);
        print('result is : $result');
        break;
      case '÷':
        result = double.parse(firstNumber) / double.parse(secondNumber);
        print('result is : $result');
        break;
      case '%':
        result = double.parse(firstNumber) % double.parse(secondNumber);
        print('result is : $result');
        break;
      case 'C':
        result = double.parse(firstNumber) + double.parse(secondNumber) * 0;
        print('result is : $result');
        break;
      // case '^':
      //   result = double.parse(firstNumber) ^ double.parse(secondNumber);
      //   print('result is : $result');
      //   break;

    }
  }

  void toggleoperator() {
    operator = true;
    print('primary operator is clicked');
  }

  void getAction(action) {
    operatorAction = action;
  }

  String setNumber(number) {
    if (operator == false) {
      firstNumber += number;
      print('firstNumber is: $firstNumber');
      return firstNumber.toString();
    } else if (operator == true) {
      secondNumber += number;
      print('secondNumber is: $secondNumber');
      return secondNumber.toString();
    } else {
      return 'Error';
    }
  }
}

class Math extends ChangeNotifier {
  String result = '0';
  String operatorAction = '';
  Numbers numbers = Numbers();
  bool isOperatorClicked = false;
  bool calculated = false;

  String getNumber(number) {
    return numbers.setNumber(number);
  }

  void operatorClicked(action) {
    numbers.toggleoperator();
    numbers.getAction(action);
    isOperatorClicked = true;
    operatorAction = numbers.operatorAction;
    notifyListeners();
  }

  void clicked() {
    if (isOperatorClicked == false && calculated == false) {
      result = numbers.firstNumber;
    } else if (isOperatorClicked == true && calculated == false) {
      result = numbers.secondNumber;
    }
    notifyListeners();
  }

  void resultIsClicked() {
    numbers.operatorIsClicked(isOperatorClicked);
    if (isOperatorClicked == true) {
      result = numbers.result.toStringAsFixed(0);
      notifyListeners();
    }
  }
}
