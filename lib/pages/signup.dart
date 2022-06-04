import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:kuliner_go/components/already_have_an_account_acheck.dart';
import 'package:kuliner_go/components/rounded_button.dart';
import 'package:kuliner_go/components/rounded_input_field.dart';
import 'package:kuliner_go/components/rounded_password_field.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String email;
  late String password;
  late String username;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 18,
              child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Daftar",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("Silahkan isi kelengkapan akunmu di bawah ini",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              )),
                        ],
                      ),
                      Image.asset(
                        "assets/Logo.png",
                        width: 270,
                      ),
                      Column(
                        children: <Widget>[
                          RoundedInputField(
                            hintText: "Your Name",
                            onChanged: (value) {
                              username = value.trim();
                            },
                          ),
                          RoundedInputField(
                            hintText: "Your Email",
                            icon: Icons.email,
                            onChanged: (value) {
                              email = value.trim();
                            },
                          ),
                          RoundedPasswordField(
                            onChanged: (value) {
                              password = value.trim();
                            },
                          ),
                        ],
                      ),
                      RoundedButton(
                        text: "Daftar",
                        press: () {
                          auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                        },
                        height: size.height * 0.07,
                      ),
                      Text(
                        "daftar dengan",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GoogleAuthButton(
                              onPressed: () {},
                              darkMode: false,
                              style: AuthButtonStyle(
                                buttonType: AuthButtonType.icon,
                                height: 35,
                                width: 35.0,
                                iconSize: 25.0,
                              ),
                            ),
                            SizedBox(
                              width: 35.0,
                            ),
                            FacebookAuthButton(
                              onPressed: () {},
                              darkMode: false,
                              style: AuthButtonStyle(
                                buttonType: AuthButtonType.icon,
                                height: 35,
                                width: 35.0,
                                iconSize: 25.0,
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            AppleAuthButton(
                              onPressed: () {},
                              darkMode: false,
                              style: AuthButtonStyle(
                                buttonType: AuthButtonType.icon,
                                height: 35.0,
                                width: 35.0,
                                iconSize: 25.0,
                              ),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Sudah punya akun?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: Text("masuk disini")),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
