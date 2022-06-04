import 'package:flutter/material.dart';
import 'package:kuliner_go/pages/onboard.dart';
import 'package:kuliner_go/pages/login.dart';
import 'package:kuliner_go/pages/signup.dart';
import 'package:kuliner_go/pages/home.dart';
import 'package:kuliner_go/pages/detail_restaurant.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Onboard(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/home': (context) => Home(),
        '/detail': (context) => DetailRestaurant(),
      },
    ));
