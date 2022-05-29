import 'package:flutter/material.dart';
import 'package:kuliner_go/pages/onboard.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Onboard(),
    // '/home': (context) => Home(),
    // '/location': (context) => ChooseLocation(),
  },
));