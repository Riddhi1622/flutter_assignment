import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = '';
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        return;
      } else {
        _output += buttonText;
      }
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      if (_operand == '+') {
        _output = (_num1 + _num2).toString();
      }
      if (_operand == '-') {
        _output = (_num1 - _num2).toString();
      }
      if (_operand == '*') {
        _output = (_num1 * _num2).toString();
      }
      if (_operand == '/') {
        _output = (_num1 / _num2).toString();
      }
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = '';
    } else {
      _output += buttonText;
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          textStyle: const TextStyle(fontSize: 24.0),
          padding: const EdgeInsets.symmetric(vertical: 23),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
          children: [
      Expanded(
      child: Container(
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.center,
      child: Text(
        _output,
        style: TextStyle(fontSize: 98.0),
      ),
    ),
    ),
    Row(
    children: [
    _buildButton('7', Colors.grey, Colors.white),
    _buildButton('8', Colors.grey, Colors.white),
    _buildButton('9', Colors.grey, Colors.white),
    _buildButton('/', Colors.orange, Colors.white),
    ],
    ),
    Row(
    children: [
    _buildButton('4', Colors.grey, Colors.white),
    _buildButton('5', Colors.grey, Colors.white),
    _buildButton('6', Colors.grey, Colors.white),
    _buildButton('*', Colors.orange, Colors.white),
    ],
    ),
    Row(
    children: [
    _buildButton('1', Colors.grey, Colors.white),
    _buildButton('2', Colors.grey, Colors.white),
    _buildButton('3', Colors.grey, Colors.white),
    _buildButton('-', Colors.orange, Colors.white),
    ],
    ),
            Row(
              children: [
                _buildButton('.', Colors.grey, Colors.white),
                _buildButton('0', Colors.grey, Colors.white),
                _buildButton('C', Colors.grey, Colors.white),
                _buildButton('+', Colors.orange, Colors.white),
              ],
            ),
            Row(
              children: [
                _buildButton('=', Colors.blue, Colors.white),
              ],
            ),
          ],
      ),
    );
  }
}
