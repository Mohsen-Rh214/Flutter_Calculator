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
    Provider.of<Math>(context, listen: false).clicked();
  }

  void actionCallback(action) {
    Provider.of<Math>(context, listen: false).operatorClicked(action);
    Provider.of<Math>(context, listen: false).clicked();
  }

  void resultCallback() {
    Provider.of<Math>(context, listen: false).resultIsClicked();
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
                SecondaryAction('C', actionCallback),
                SecondaryAction('%', actionCallback),
                SecondaryAction('^', actionCallback),
                PrimaryAction('÷', actionCallback),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton('7', numberCallback),
                NumberButton('8', numberCallback),
                NumberButton('9', numberCallback),
                PrimaryAction('×', actionCallback),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton('4', numberCallback),
                NumberButton('5', numberCallback),
                NumberButton('6', numberCallback),
                PrimaryAction('-', actionCallback),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton('1', numberCallback),
                NumberButton('2', numberCallback),
                NumberButton('3', numberCallback),
                PrimaryAction('+', actionCallback),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BackSpaceButton(),
                NumberButton('0', numberCallback),
                NumberButton('.', numberCallback),
                ResultButton('=', resultCallback),
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
  final String number;
  final Function voidCallback;

  const NumberButton(this.number, this.voidCallback);

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    var a = widget.number;
    double size = MediaQuery
        .of(context)
        .size
        .height * 0.1;
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
          widget.number,
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
  final Function voidCallback;

  const PrimaryAction(this.action, this.voidCallback);

  @override
  State<PrimaryAction> createState() => _PrimaryActionState();
}

class _PrimaryActionState extends State<PrimaryAction> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery
        .of(context)
        .size
        .height * 0.1;
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
          widget.voidCallback(widget.action);
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

class SecondaryAction extends StatefulWidget {
  final String action;
  final Function voidCallback;

  const SecondaryAction(this.action, this.voidCallback);

  @override
  State<SecondaryAction> createState() => _SecondaryActionState();
}

class _SecondaryActionState extends State<SecondaryAction> {

  @override
  Widget build(BuildContext context) {

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
          widget.voidCallback(widget.action);
        },
        child: Text(
        widget.action,
        style: TextStyle(
      color: Colors.white,
      fontSize: 35,
        fontWeight: FontWeight.w400,
      ),
    ),)
    ,
    );
  }
}

class ResultButton extends StatefulWidget {
  final String click;
  final Function voidCallback;

  const ResultButton(this.click, this.voidCallback);

  @override
  State<ResultButton> createState() => _ResultButtonState();
}

class _ResultButtonState extends State<ResultButton> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery
        .of(context)
        .size
        .height * 0.1;
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
        onPressed: () {
          widget.voidCallback();
        },
        child: Text(
          widget.click,
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
