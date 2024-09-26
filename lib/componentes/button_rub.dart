import 'package:flutter/material.dart';

sealed class ButtonClick extends StatelessWidget {
  final String value;

  const ButtonClick(this.value, {super.key});
}

class ButtonRub extends StatefulWidget {
  const ButtonRub({super.key});

  @override
  _ButtonRubState createState() => _ButtonRubState();
}

class _ButtonRubState extends State<ButtonRub> {
  String _displayText = '';
  String _operation = '';
  double? _firstOperand;
  double? _secondOperand;

  void _handleButtonClick(String value) {
    setState(() {
      if (value == 'C') {
        _displayText = '';
        _firstOperand = null;
        _secondOperand = null;
        _operation = '';
      } else if (value == 'CE') {
        _displayText = '';
      } else if (value == '+' || value == '-' || value == 'x' || value == '/') {
        _operation = value;
        _firstOperand = double.tryParse(_displayText);
        _displayText = '';
      } else if (value == '=') {
        _secondOperand = double.tryParse(_displayText);
        if (_firstOperand != null && _secondOperand != null) {
          switch (_operation) {
            case '+':
              _displayText = (_firstOperand! + _secondOperand!).toString();
              break;
            case '-':
              _displayText = (_firstOperand! - _secondOperand!).toString();
              break;
            case 'x':
              _displayText = (_firstOperand! * _secondOperand!).toString();
              break;
            case '/':
              _displayText = (_firstOperand! / _secondOperand!).toString();
              break;
          }
        }
        _firstOperand = null;
        _secondOperand = null;
        _operation = '';
      } else {
        _displayText += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              _displayText,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
        //aqui eu pedi para a gemini adicionar cores ao botoes e mudar o formato para quadrado

          flex: 3,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 1, 
            children: [
              _buildButton('7', Colors.blue),
              _buildButton('8', Colors.blue),
              _buildButton('9', Colors.blue),
              _buildButton('/', Colors.orange),
              _buildButton('4', Colors.blue),
              _buildButton('5', Colors.blue),
              _buildButton('6', Colors.blue),
              _buildButton('x', Colors.orange),
              _buildButton('1', Colors.blue),
              _buildButton('2', Colors.blue),
              _buildButton('3', Colors.blue),
              _buildButton('-', Colors.orange),
              _buildButton('0', Colors.blue),
              _buildButton('.', Colors.blue),
              _buildButton('=', Colors.orange),
              _buildButton('+', Colors.orange),
              _buildButton('C', Colors.red),
              _buildButton('CE', Colors.red),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String value, Color color) {
    return ElevatedButton(
      onPressed: () => _handleButtonClick(value),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: ButtonRub(),
    ),
  ));
}
