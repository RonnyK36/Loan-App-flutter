import 'package:flutter/material.dart';
import 'package:flutter_loan_app/configurations/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "L",
                style: kTitlesTextStyle,
              ),
            ),
            SizedBox(width: 5),
            Text("LENDERS"),
          ],
        ),
        elevation: 2,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: const Center(
          child: Text(
        "Home",
        style: kTitlesTextStyle,
      )),
    );
  }
}
