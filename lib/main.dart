import 'package:flutter/material.dart';

void main() {
  runApp(FlutterCalculatorApp());
}

class FlutterCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String displayText = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'CLEAR') {
        displayText = '0';
        num1 = 0;
        num2 = 0;
        operand = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        num1 = double.parse(displayText);
        operand = buttonText;
        displayText = '0';
      } else if (buttonText == '=') {
        num2 = double.parse(displayText);
        if (operand == '+') {
          displayText = (num1 + num2).toString();
        } else if (operand == '-') {
          displayText = (num1 - num2).toString();
        } else if (operand == '*') {
          displayText = (num1 * num2).toString();
        } else if (operand == '/') {
          if (num2 != 0) {
            displayText = (num1 / num2).toString();
          } else {
            displayText = 'Error';
          }
        }
        num1 = 0;
        num2 = 0;
        operand = '';
      } else {
        displayText = displayText == '0' ? buttonText : displayText + buttonText;
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: [
                  buildButton('0'),
                  buildButton('CLEAR'),
                  buildButton('='),
                  buildButton('+'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
