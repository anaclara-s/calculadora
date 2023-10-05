import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'constants.dart';
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
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(kEdgeInsets),
            alignment: Alignment.centerRight,
            child: Text(
              screenOperation,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(kEdgeInsets),
            alignment: Alignment.centerRight,
            child: Text(
              screenResult,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: buttons.length,
                itemBuilder: ((BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (buttons[index] == 'C') {
                          clearScreenOp();
                          clearScreenResult();
                        } else if (buttons[index] == 'DEL') {
                          removeLastChar();
                        } else if (buttons[index] == '=') {
                          equalPressed();
                        } else if (isOperator(previus) &&
                            isOperator(buttons[index])) {
                          return;
                        } else {
                          setState(() {
                            screenOperation += buttons[index];
                            previus = buttons[index];
                          });
                        }
                      },
                      child: Text(
                        buttons[index],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '+' || x == '-' || x == '*' || x == '%' || x == '=' || x == '/') {
      return true;
    }
    return false;
  }

  void clearScreenOp() {
    setState(() {
      screenOperation = '';
      previus = '';
    });
  }

  void clearScreenResult() {
    setState(() {
      screenResult = '';
      previus = '';
    });
  }

  void removeLastChar() {
    setState(() {
      screenOperation =
          screenOperation.substring(0, screenOperation.length - 1);
    });
  }

  void equalPressed() {
    String a = screenOperation;
    Parser p = Parser();
    Expression exp = p.parse(a);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      screenResult = eval.toString();
      clearScreenOp();
    });
  }
}
