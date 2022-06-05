import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kuliner_go/pages/onboard.dart';
import 'package:kuliner_go/pages/login.dart';
import 'package:kuliner_go/pages/signup.dart';
import 'package:kuliner_go/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kuliner_go/pages/verification.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KulinerGo());
}

class KulinerGo extends StatefulWidget {
  const KulinerGo({Key? key}) : super(key: key);

  @override
  State<KulinerGo> createState() => _KulinerGoState();
}

class _KulinerGoState extends State<KulinerGo> {
  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? "/login" : "/home",
      routes: {
        '/': (context) => Onboard(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/home': (context) => Home(),
        '/verification': (context) => Verifikasi(),
      },
    );
  }
}
