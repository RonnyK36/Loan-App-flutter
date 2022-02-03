import 'package:flutter/material.dart';
import 'package:flutter_loan_app/configurations/config.dart';

class LoansScreen extends StatefulWidget {
  const LoansScreen({Key? key}) : super(key: key);

  @override
  _LoansScreenState createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Loans",
        style: kTitlesTextStyle,
      )),
    );
  }
}
