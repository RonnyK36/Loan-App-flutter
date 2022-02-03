import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final String labelText;
  final String prefix;
  final bool isDate;
  // final TextInputFormatter? dateformatter;
  final int maxLength;

  final TextInputType textInputType;

  TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPassword = false,
    this.isDate = false,
    required this.hintText,
    // this.dateformatter,
    required this.labelText,
    required this.prefix,
    required this.maxLength,
    required this.textInputType,
  }) : super(key: key);
  final DateInputFormatter dateInputFormatter = DateInputFormatter();

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      inputFormatters: isDate ? [dateInputFormatter] : [],
      controller: textEditingController,
      maxLength: maxLength,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(prefix),
          ),
          border: inputBorder,
          focusedBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
