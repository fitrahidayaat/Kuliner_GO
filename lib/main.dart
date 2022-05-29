import 'package:flutter/material.dart';
import 'package:kuliner_go/pages/tutorial.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Tutorial(),
    // '/home': (context) => Home(),
    // '/location': (context) => ChooseLocation(),
  },
));