import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loan_app/configurations/config.dart';
import 'package:flutter_loan_app/widgets/reusable_button.dart';
import 'package:flutter_loan_app/widgets/text_field.dart';

class CreateAccount extends StatefulWidget {
  final String phone;
  const CreateAccount({Key? key, required this.phone}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? uid;
  String? phone;
  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create an Account"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              children: [
                // Column(
                //   children: [
                //     // const SizedBox(height: 10),
                //     Text("Verified 0${widget.phone} 😍!", style: kTitlesTextStyle),
                //     const SizedBox(height: 10),
                //     const Text("Give us few more details about you: ",
                //         style: kInforText),
                //   ],
                // ),
                Flexible(child: Container(), flex: 1),

                TextFieldInput(
                  textEditingController: nameController,
                  hintText: "Kelvin Rono",
                  maxLength: 80,
                  prefix: "",
                  labelText: "Full Legal Name",
                  textInputType: TextInputType.name,
                ),
                TextFieldInput(
                  textEditingController: dateController,
                  hintText: "DD/MM/YYYY",
                  maxLength: 10,
                  isDate: true,
                  prefix: "",
                  labelText: "Date of Birth",
                  textInputType: TextInputType.datetime,
                ),
                TextFieldInput(
                  textEditingController: nationalIDController,
                  hintText: "12345678",
                  maxLength: 8,
                  prefix: "",
                  labelText: "National ID Number",
                  textInputType: TextInputType.number,
                ),
                TextFieldInput(
                  textEditingController: emailController,
                  hintText: "ronnykelvin@gmail.com",
                  maxLength: 80,
                  prefix: "",
                  labelText: "Email Address",
                  textInputType: TextInputType.emailAddress,
                ),
                // TextFieldInput(
                //   textEditingController: passwordController,
                //   hintText: "8+ Characters",
                //   maxLength: 16,
                //   prefix: "",
                //   labelText: "Password",
                //   isPassword: true,
                //   textInputType: TextInputType.visiblePassword,
                // ),
                // Flexible(child: Container(), flex: 2),
                reusableButton(onPressed: () {}, label: "Create Account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
