import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'math.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var result = Provider.of<Math>(context).showOnScreen();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text(
                Provider.of<Math>(context).operatorAction,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
            Text(
              Provider.of<Math>(context).result.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
