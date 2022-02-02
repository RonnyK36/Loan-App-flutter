import 'package:flutter/material.dart';
import 'package:flutter_loan_app/configurations/config.dart';
import 'package:flutter_loan_app/screens/otp.dart';
import 'package:flutter_loan_app/widgets/reusable_button.dart';
import 'package:flutter_loan_app/widgets/text_field.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              const Text(
                // Logo placeholder
                "LOAN LENDER LOGO",
                style: kTitlesTextStyle,
              ),
              Flexible(child: Container(), flex: 1),
              TextFieldInput(
                textEditingController: phoneNumberController,
                labelText: "Phone number",
                prefix: "(+254)",
                hintText: "727447786",
                textInputType: TextInputType.phone,
              ),
              const SizedBox(height: 30),
              reusableButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(
                          phone: phoneNumberController.text,
                        ),
                      ),
                    );
                  },
                  label: "Submit"),
              const SizedBox(height: 30),
              const Text(
                "You will receive a One Time Password (OTP) to verify your phone number for security reasons.",
                style: kInforText,
              ),
              const SizedBox(height: 20),
              Flexible(child: Container(), flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
