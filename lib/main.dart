import 'package:flutter/material.dart';
import 'package:kuliner_go/pages/onboard.dart';
import 'package:kuliner_go/pages/login.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
    '/': (context) => Onboard(),
    '/login': (context) => Login(),
    // '/home': (context) => Home(),
    // '/location': (context) => ChooseLocation(),
  },
));