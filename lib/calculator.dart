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
  var previousResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              height: 100,
              padding: EdgeInsets.only(right: kEdgeInsets),
              alignment: Alignment.centerRight,
              child: Text(
                screenOperation,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.only(right: kEdgeInsets),
            alignment: Alignment.centerRight,
            child: Text(
              screenResult,
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: kEdgeInsets, right: kEdgeInsets),
            child: const Divider(
              height: 1,
              thickness: 0.8,
              color: bgElevatedButtonColor,
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
                          clearScreenResult();
                        } else if (buttons[index] == '=') {
                          equalPressed();
                        } else if (buttons[index] == 'ANS') {
                          setState(() {
                            screenOperation += previousResult;
                            previus = previousResult;
                          });
                        } else if (buttons[index] == '%') {
                          setState(() {
                            screenOperation += buttons[index];
                            previus = buttons[index];
                          });
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
    if (screenOperation.isNotEmpty) {
      setState(() {
        screenOperation =
            screenOperation.substring(0, screenOperation.length - 1);
      });
    }
  }

  void equalPressed() {
    String screenOper = screenOperation;

    if (screenOper.contains('%')) {
      List<String> parts = screenOper.split('%');
      if (parts.length == 2) {
        double? leftOperand = double.tryParse(parts[0]);
        double? rightOperand = double.tryParse(parts[1]);
        if (leftOperand != null && rightOperand != null) {
          screenOper = (leftOperand / 100 * rightOperand).toString();
        }
      }
    }

    Parser parser = Parser();
    Expression exp = parser.parse(screenOper);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      screenResult = eval.toString();
      previousResult = screenResult;
      clearScreenOp();
    });
  }
}
