import 'package:flutter/material.dart';
import 'package:flutter_todo/components/text_widget.dart';
import 'package:flutter_todo/constants.dart' as constants;

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      this.label = '',
      this.type = constants.textField,
      this.hint = '',
      this.onChanged,
      required this.validator});

  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String> validator;
  final String type;
  final String hint;
  final dynamic onChanged;

  @override
  Widget build(BuildContext context) {
    if (type == constants.passwordField) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextWidget(text: label, fontSize: 16, opacity: 0.87),
                  )
                : Container(),
            TextFormField(
              style: TextStyle(
                  color: const Color(0xffffffff).withOpacity(0.87),
                  fontSize: 16),
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle:
                    const TextStyle(fontSize: 16, color: Color(0xff535353)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 0.8,
                  ),
                ),
              ),
              validator: validator,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              onChanged: onChanged
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextWidget(text: label, fontSize: 16, opacity: 0.87),
                )
              : Container(),
          TextFormField(
            style: TextStyle(
                color: const Color(0xffffffff).withOpacity(0.87), fontSize: 16),
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  const TextStyle(fontSize: 16, color: Color(0xff535353)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.8,
                ),
              ),
            ),
            validator: validator,
            onChanged: onChanged
          ),
        ],
      ),
    );
  }
}
