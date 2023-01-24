import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loiginpage/views/screens/screen_login.dart';

import '../../controller/user_Controller.dart';

class ForgetPassword extends StatelessWidget {
  UserController Controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: Controller.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () async{
                  var response = await Controller.forgetPassword();
                  if (response == 'Sccussful'){
                    Get.snackbar('Sccussful', 'sendEmail', );
                    Get.to(MyStatefulWidget());
                  }else{
                    Get.snackbar("Alert", response.toString(),);
                  }
                },
                child: Text('Send Email'),
              )),
        ],
      ),
    );
  }
}
