import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/math.dart';
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

class ResultsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var result = Provider.of<Math>(context).result.toStringAsFixed(0);
    return Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF1C1D1F),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Text(
          result,
          style: TextStyle(
            color: Colors.white,
            fontSize: 90,
          ),
        ),
      ),
    );
  }
}
