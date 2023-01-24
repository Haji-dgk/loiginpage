import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var secondNameController = TextEditingController();
  var firstNameController = TextEditingController();
  var ForgetPasswordController = TextEditingController();
  RxBool isObscure = true.obs;

  // void registration() async {
  //   String firstN = firstNameController.text;
  //   String ForgetP = firstNameController.text;
  //   String secondN = secondNameController.text;
  //   String myEmail = emailController.text;
  //   String mypassword = passwordController.text;
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: myEmail, password: mypassword)
  //       .then((value) {
  //     print("User register seccfully");
  //     var userId = value.user!.uid;
  //     var user = model.User(
  //         ForgetPassword: ForgetP,
  //         password: mypassword,
  //         email: myEmail,
  //         firstName: firstN,
  //         secondName: secondN,
  //         uid: userId);
  //     FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(userId)
  //         .set((user.toMap()))
  //         .then((value) {
  //       print("Db Store");
  //     }).catchError((response) {
  //       print(response);
  //       Get.snackbar("Alert", "Something Wrong");
  //     }).catchError((response) {
  //       return (response);
  //     });
  //   });
  // }

  Future<String> login() async {
    String response = "";
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      response = "Sccussful";
    }).catchError((error) {
      response = error.toString();
    });
    return response;
  }

  Future<String> signup() async {
    String response = "";
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return "Please Enter Email & Password";
    }
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      response = "Sccussful";
    }).catchError((error) {
      response = error.toString();
    });
    return response;
  }

  Future<String> forgetPassword() async {
    String response = "";
    String email = emailController.text.trim();
    await FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: email,
    )
        .then((value) {
      response = "Sccussful";
    }).catchError((error) {
      response = error.toString();
    });
    return response;
  }//
}
