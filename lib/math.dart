import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Math extends ChangeNotifier{
  double a = 0;
  double b = 0;
  double c = 0;
  double result = 0;

  void add() {
    result = a + b;
    notifyListeners();
  }

  void subtract() {
    result = a - b;
    notifyListeners();
  }

  void multiple() {
    result = a * b;
    notifyListeners();
  }

  void divide() {
    result = a / b;
    notifyListeners();
  }
  double get showOnScreen {
    if(a!=0) {
      a = result;
    } else {
      b = result;
    }
    return result;
    notifyListeners();
  }
}
