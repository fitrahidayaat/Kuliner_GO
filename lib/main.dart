import 'package:flutter/material.dart';
import 'package:kuliner_go/pages/onboard.dart';
import 'package:kuliner_go/pages/login.dart';
import 'package:kuliner_go/pages/signup.dart';
import 'package:kuliner_go/pages/home.dart';
import 'package:kuliner_go/pages/detail_restaurant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kuliner_go/pages/verification.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Onboard(),
      '/login': (context) => Login(),
      '/signup': (context) => Signup(),
      '/home': (context) => Home(),
      '/detail': (context) => DetailRestaurant(),
      '/verivication': (context) => Verifikasi(),
    },
  ));
}
