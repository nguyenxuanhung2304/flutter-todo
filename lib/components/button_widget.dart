import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart' as constants;

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      this.size = constants.btnLarge,
      required this.onPressed,
      this.outline = false,
      this.borderColor = const Color(0xff8875FF),
      this.backgroundColor = const Color(0xff8875FF),
      required this.child,
      this.opacity});

  final String size;
  final VoidCallback? onPressed;
  final dynamic opacity;
  final bool outline;
  final Widget child;
  final Color borderColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (opacity != null) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor.withOpacity(opacity),
            minimumSize: const Size.fromHeight(40)),
        child: child,
      );
    }

    if (outline) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(40),
            side: BorderSide(color: borderColor)),
        child: child,
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: const Size.fromHeight(40)),
      child: child,
    );
  }
}
