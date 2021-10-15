import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/math.dart';
import 'package:flutter_calculator/result_screen.dart';
import 'package:provider/provider.dart';
import 'buttons.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF1C1D1F), // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Math(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF000000),
          body: Column(children: <Widget>[

            ResultsScreen(),
            ButtonsPad(),
          ]),
        ),
      ),
    );
  }
}
