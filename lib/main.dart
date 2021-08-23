import 'package:flutter/material.dart';
import 'package:projet_td/pages/LoginPage.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.grey),
    home: LoginPage(),
  ));
}


