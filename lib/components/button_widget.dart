import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart' as constants;

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      this.size = constants.btnLarge,
      required this.onPressed,
      this.outline = false,
      this.borderColor = const Color(0xff8875FF),
      required this.child,
      this.opacity});

  final String size;
  final VoidCallback? onPressed;
  final dynamic opacity;
  final bool outline;
  final Widget child;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    if (opacity != null) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xff8875FF).withOpacity(opacity),
            minimumSize: const Size.fromHeight(40)),
        child: child,
      );
    }

    if (outline) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(40),
            side: BorderSide(color: borderColor)
        ),
        child: child,
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff8875FF),
          minimumSize: const Size.fromHeight(40)),
      child: child,
    );
  }
}
