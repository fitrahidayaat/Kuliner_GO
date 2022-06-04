import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kuliner_go/pages/signup.dart';
import 'dart:async';

class Verifikasi extends StatefulWidget {
  const Verifikasi({Key? key}) : super(key: key);

  @override
  State<Verifikasi> createState() => _VerifikasiState();
}

class _VerifikasiState extends State<Verifikasi> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Timer timer;
  late Duration time = Duration(minutes: 5);

  @override
  void initState() async {
    late User? user = auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }

    timer = Timer.periodic(time, (timer) {
      checkEmailVerivied();
    });
    super.initState();
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'An email has been sent to ${auth.currentUser?.email ?? "NULL"} please verify'),
      ),
    );
  }

  Future<void> checkEmailVerivied() async {
    late User? user = auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      user.reload();
      if (user.emailVerified) {
        timer.cancel();
        Navigator.pushNamed(context, '/home');
      }
    }
  }
}
