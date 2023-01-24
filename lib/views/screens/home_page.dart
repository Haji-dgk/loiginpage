import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loiginpage/views/screens/screen_login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("LogOut"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Get.to(MyStatefulWidget());
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
