import 'package:calculadora/constants.dart';
import 'package:flutter/material.dart';

import 'list_buttons.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var screenOperation = '';
  var screenResult = '';
  var previus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(kEdgeInsets),
            alignment: Alignment.centerRight,
            child: Text(
              screenOperation,
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(kEdgeInsets),
            alignment: Alignment.centerRight,
            child: Text(
              screenResult,
              style: TextStyle(
                fontSize: 50,
                color: Colors.pink,
              ),
            ),
          ),
          Container(
            child: Center(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: buttons.length,
                itemBuilder: ((BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
