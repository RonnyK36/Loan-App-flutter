import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final String labelText;
  final String prefix;
  final TextInputType textInputType;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPassword = false,
    required this.hintText,
    required this.labelText,
    required this.prefix,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      maxLength: 9,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefix: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(prefix),
        ),
        border: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(10),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
