import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const MyText({Key? key, required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style??const TextStyle(letterSpacing: 0.5),
      textScaleFactor: 1.0
    );
  }
}
