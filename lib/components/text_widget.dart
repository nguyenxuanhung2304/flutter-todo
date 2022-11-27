import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key, required this.text, this.fontSize = 16, this.opacity});

  final String text;
  final double fontSize;
  final dynamic opacity;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Colors.white, fontSize: fontSize);

    if (opacity != null) {
      return Opacity(
        opacity: opacity,
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      );
    }

    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
