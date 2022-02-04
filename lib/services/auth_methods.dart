import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createNewUser(
      {required String fullName,
      required String nationalID,
      required String date,
      required String phone,
      required String email,
      required String password}) async {
    String result = "An error occured creating the user";
    try {
      if (fullName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          nationalID.isNotEmpty &&
          date.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(credential.user!.uid);
        _firestore.collection("users").doc(credential.user!.uid).set({
          "phoneNumber": phone,
          "fullName": fullName,
          "uid": credential.user!.uid,
          "email": email,
          "nationalID": nationalID,
          "date": date,
          "currentLoan": 0,
          "previousLoans": [],
        });
        result = "success";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        result = "Please check the email again";
      } else if (error.code == "weak-password") {
        result = "Try a stronger password";
      }
    } catch (error) {
      result = error.toString();
    }

    return result;
  }
}
