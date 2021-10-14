import 'package:flutter/material.dart';
import 'package:flutter_calculator/math.dart';
import 'package:provider/provider.dart';

class ButtonsPad extends StatefulWidget {
  @override
  State<ButtonsPad> createState() => _ButtonsPadState();
}

class _ButtonsPadState extends State<ButtonsPad> {
  void numberCallback(number) {
    Provider.of<Math>(context, listen: false).getNumber(number);
  }

  void actionCallback() {
    Provider.of<Math>(context, listen: false).isOperatorClicked();
    //todo: a method that switches between actions
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Action2ndButton('C'),
                Action2ndButton('%'),
                Action2ndButton('^'),
                PrimaryAction('÷', actionCallback),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(7, numberCallback),
                NumberButton(8, numberCallback),
                NumberButton(9, numberCallback),
                PrimaryAction('×', actionCallback),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(4, numberCallback),
                NumberButton(5, numberCallback),
                NumberButton(6, numberCallback),
                PrimaryAction('-', actionCallback),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(1, numberCallback),
                NumberButton(2, numberCallback),
                NumberButton(3, numberCallback),
                PrimaryAction('+', actionCallback),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BackSpaceButton(),
                NumberButton(0, numberCallback),
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

class NumberButton extends StatefulWidget {
  final int number;
  final Function voidCallback;

  const NumberButton(this.number, this.voidCallback);

  @override
  State<NumberButton> createState() => _NumberButtonState();
}
// bool flag;

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    var a = widget.number;
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
          widget.voidCallback(widget.number);
        },
        child: Text(
          widget.number.toStringAsFixed(0),
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

class PrimaryAction extends StatefulWidget {
  final String action;
  final Function actionCallback;

  const PrimaryAction(this.action, this.actionCallback);

  @override
  State<PrimaryAction> createState() => _PrimaryActionState();
}
bool flagAction = true;

class _PrimaryActionState extends State<PrimaryAction> {
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
        onPressed: () {
          widget.actionCallback();
        },
        child: Text(
          widget.action,
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

class BackSpaceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double size = MediaQuery.of(context).size.height * 0.1;
    return Container(
      margin: EdgeInsets.all(5),
      height: 71,
      width: 71,
      child: IconButton(
        icon: Icon(
          Icons.backspace_outlined,
          color: Color(0xFFFFFFFF),
        ),
        iconSize: 30,
        onPressed: () {},
      ),
    );
  }
}
