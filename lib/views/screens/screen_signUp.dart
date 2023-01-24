import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loiginpage/controller/user_Controller.dart';
import 'package:loiginpage/views/screens/screen_login.dart';

import 'home_page.dart';

class Sigin extends StatelessWidget {
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'SignUp',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: userController.firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: userController.secondNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Second Name',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: userController.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: userController.isObscure.value,
              controller: userController.passwordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      userController.isObscure.value =
                          !(userController.isObscure.value);
                    },
                    icon: (userController.isObscure.value)
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.remove_red_eye_outlined)),
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password',
            ),
          ),
          Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () async {
                  var response = await userController.signup();
                  if (response == 'Sccussful') {
                    Get.snackbar('Sccussful', 'User signUp',
                      dismissDirection: DismissDirection.horizontal,

                    );
                    userController.emailController.clear();
                    userController.firstNameController.clear();
                    userController.secondNameController.clear();
                    userController.passwordController.clear();
                    Get.offAll(MyStatefulWidget());
                  } else {
                    Get.snackbar("Alert", response.toString(),
                        dismissDirection: DismissDirection.horizontal,

                        icon: Icon(
                          Icons.info,
                          color: Colors.red,
                        ));
                  }
                },
                child: Text('SignUp'),
              )),
        ],
      ),
    );
  }
}
