import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:kuliner_go/components/already_have_an_account_acheck.dart';
import 'package:kuliner_go/components/rounded_button.dart';
import 'package:kuliner_go/components/rounded_input_field.dart';
import 'package:kuliner_go/components/rounded_password_field.dart';
import 'package:auth_buttons/auth_buttons.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 0.1 * size.height,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Container(
              child: Container(
                  height: 0.9 * size.height,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Masuk",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("Masukkan email dan kata sandi akunmu",
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
                        width: 300,
                      ),
                      Column(
                        children: <Widget>[
                          RoundedInputField(
                            hintText: "Your Email",
                            onChanged: (value) {},
                          ),
                          RoundedPasswordField(
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      RoundedButton(
                        text: "Masuk",
                        press: () {},
                        height: size.height * 0.07,
                      ),
                      Text(
                        "masuk dengan",
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
                                height: 30,
                                width: 30.0,
                                iconSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            FacebookAuthButton(
                              onPressed: () {},
                              darkMode: false,
                              style: AuthButtonStyle(
                                buttonType: AuthButtonType.icon,
                                height: 30,
                                width: 30.0,
                                iconSize: 20.0,
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
                                height: 30,
                                width: 30.0,
                                iconSize: 20.0,
                              ),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Tidak punya akun?"),
                          TextButton(
                              onPressed: () {}, child: Text("daftar disini")),
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
