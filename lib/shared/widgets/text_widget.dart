import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String txt;
  final double size;
  final bool weight;
  final dynamic cor;

  const TextWidget(
      {super.key,
      required this.txt,
      this.size = 15,
      this.weight = false,
      this.cor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          // foreground: Paint(),
          // ..style = PaintingStyle.stroke
          // ..strokeWidth = 6
          // ..color = Colors.blue,
          fontSize: size,
          fontWeight: weight ? FontWeight.bold : FontWeight.normal,
          color: cor),
    );
  }
}
