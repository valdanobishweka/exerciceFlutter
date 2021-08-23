import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projet_td/pages/EditPage.dart';
import 'package:projet_td/pages/userPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  Dio _dio = Dio();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCustomInput(usernameController, screenSize, false,
                label: "Username"),
            buildCustomInput(passwordController, screenSize, true,
                label: "password"),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                login();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConnectedUser(
                      login: login(),
                    ),
                  ),
                );
              },
              child: Container(
                width: screenSize.width / 2,
                alignment: Alignment.center,
                color: Colors.green,
                height: 20,
                child: Text('Sign in',style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditPage())),
        child: Container(
         // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          color: Colors.green,
          height: 20,
          child: Text('Sign up',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }

  buildCustomInput(controller, screenSize, isPassword, {label}) {
    return Container(
      height: 50,
      width: screenSize.width * .80,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: '$label',
        ),
      ),
    );
  }

  login() async {
    var _data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    try {
      var response = await _dio.post(
        'http://192.168.137.1:3535/students/login',
        data: _data,
      );
      return response.data;
    } catch (e) {
      print('$e');
    }
  }
}
