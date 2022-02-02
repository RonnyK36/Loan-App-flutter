import 'package:flutter/material.dart';

Container reusableButton(
    {required VoidCallback onPressed, required String label}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 9),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        primary: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    ),
  );
}
