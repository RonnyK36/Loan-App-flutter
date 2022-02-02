import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loan_app/configurations/config.dart';
import 'package:flutter_loan_app/screens/create_account.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(25, 21, 99, 1),
    // color: Colors.blue,
    borderRadius: BorderRadius.circular(15.0),
  );
  String? verificationCode;

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Verification"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "You will get a code through +254-${widget.phone}.",
                style: kInforText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: PinPut(
              eachFieldWidth: 25.0,
              eachFieldHeight: 45.0,
              withCursor: true,
              fieldsCount: 6,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              eachFieldMargin: const EdgeInsets.symmetric(horizontal: 5),
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.scale,
              textStyle: const TextStyle(
                  color: Colors.white, fontSize: 20.0, height: 1),
              onSubmit: (String pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode!, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      // Next screen
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const CreateAccount()),
                          (route) => false);
                      print("Home Screen");
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid OTP, please check and try again."),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+254${widget.phone}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              // Go to create account screen
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (c) => const CreateAccount()),
                  (route) => false);
              print("User logged in");
            }
          });
        },
        verificationFailed: (FirebaseAuthException error) {
          print(error.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }
}
