import 'package:calculadora/componentes/button_rub.dart';
import 'package:calculadora/componentes/dyplay.dart';
import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        children: [
         Expanded(
          flex: 1,
        child: display(value: "teste 4",),
         ),
         Expanded(
          flex: 3,
        child: ButtonRub(),
         ),
        ],
      ),
    );
  }
}
