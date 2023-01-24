import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loiginpage/controller/user_Controller.dart';
import 'package:loiginpage/views/screens/home_page.dart';
import 'package:loiginpage/views/screens/screen_signUp.dart';

import 'forget_password.dart';

class MyStatefulWidget extends StatelessWidget {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 30),
        ),
      ),
      body: Obx(
        () => ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
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
                controller: userController.passwordController,
                obscureText: userController.isObscure.value,
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
                  // this button is used to toggle the password visibility
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(ForgetPassword());
                //forgot password screen
              },
              child: Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    var response = await userController.login();
                    if (response == 'Sccussful') {
                      userController.emailController.clear();
                      userController.passwordController.clear();
                      Get.offAll(HomePage());
                      Get.snackbar(
                        dismissDirection: DismissDirection.horizontal,
                        'Sccussful',
                        'User Login',
                        icon: Icon(
                          Icons.done_all,
                          color: Colors.black,
                        ),
                      );
                    } else {
                      Get.snackbar("Alert", response.toString(),
                          dismissDirection: DismissDirection.horizontal,
                          icon: Icon(
                            Icons.info,
                            color: Colors.red,
                          ));
                    }
                  },
                  child: Text('Login'),
                )),
            Row(
              children: <Widget>[
                Text('Does not have account?'),
                TextButton(
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.to(Sigin());
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
