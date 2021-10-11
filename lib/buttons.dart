import 'package:flutter/material.dart';
import 'package:flutter_calculator/math.dart';
import 'package:provider/provider.dart';

class ButtonsPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Action2ndButton('C'),
                Action2ndButton('%'),
                Action2ndButton('^'),
                ActionButton('÷'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(7),
                NumberButton(8),
                NumberButton(9),
                ActionButton('×'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(4),
                NumberButton(5),
                NumberButton(6),
                ActionButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(1),
                NumberButton(2),
                NumberButton(3),
                ActionButton('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BackSpaceButton(),
                NumberButton(0),
                Action2ndButton('.'),
                ResultButton('='),
                // _actionButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String action;

  const ActionButton(this.action);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.1;
    return Container(
      margin: EdgeInsets.all(5),
      height: 71,
      width: 71,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF1C1D1F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {},
        child: Text(
          action,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class Action2ndButton extends StatelessWidget {
  final String action;

  const Action2ndButton(this.action);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.1;
    return Container(
      margin: EdgeInsets.all(5),
      height: 71,
      width: 71,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {},
        child: Text(
          action,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class ResultButton extends StatelessWidget {
  final String action;

  const ResultButton(this.action);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.1;
    return Container(
      margin: EdgeInsets.all(5),
      height: 71,
      width: 71,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFC41442),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {},
        child: Text(
          action,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final double number;

  const NumberButton(this.number);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.1;
    return Container(
      margin: EdgeInsets.all(5),
      height: 71,
      width: 71,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
            Provider.of<Math>(context,listen: false).showOnScreen;
            print(Provider.of<Math>(context, listen: false).a);
        },
        child: Text(
          number.toStringAsFixed(0),
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class BackSpaceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double size = MediaQuery.of(context).size.height * 0.1;
    return Container(
      margin: EdgeInsets.all(5),
      height: 71,
      width: 71,
      child: IconButton(
        icon: Icon(Icons.backspace_outlined,color: Color(0xFFFFFFFF),),
        iconSize: 30,
        onPressed: () {},
      ),
    );
  }
}
