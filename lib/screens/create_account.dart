import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loan_app/configurations/config.dart';
import 'package:flutter_loan_app/configurations/utils.dart';
import 'package:flutter_loan_app/screens/bottom_navigation.dart';
import 'package:flutter_loan_app/services/auth_methods.dart';
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
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  void dispose() {
    nameController.dispose();
    nationalIDController.dispose();
    dateController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void createUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await Auth().createNewUser(
      phone: "0${widget.phone}",
      fullName: nameController.text,
      nationalID: nationalIDController.text,
      date: dateController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (result != "success") {
      snackBar(content: result, context: context);
    }
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create an Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              children: [
                Text("Verified 0${widget.phone} ????!", style: kTitlesTextStyle),
                const SizedBox(height: 40),
                const Text("Give us few more details about you: ",
                    style: kInforText),
                const SizedBox(height: 20),
                TextFieldInput(
                  textEditingController: nameController,
                  hintText: "Kelvin Rono",
                  maxLength: 80,
                  prefix: "",
                  labelText: "Full Legal Name",
                  textInputType: TextInputType.text,
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
                TextFieldInput(
                  textEditingController: passwordController,
                  hintText: "8+ Characters",
                  maxLength: 16,
                  prefix: "",
                  labelText: "Password",
                  isPassword: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                _isLoading
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : reusableButton(
                        onPressed: createUser, label: "Create Account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
