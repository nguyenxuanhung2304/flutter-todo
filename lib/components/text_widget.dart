import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.opacity,
      this.child,
      this.color = Colors.white,
      this.align = TextAlign.left});

  final String text;
  final double fontSize;
  final dynamic opacity;
  final TextAlign align;
  final dynamic child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: color, fontSize: fontSize);

    if (opacity != null) {
      return Opacity(
        opacity: opacity,
        child: Text(text, style: textStyle, textAlign: align),
      );
    }

    return Text(text, style: textStyle, textAlign: align);
  }
}
