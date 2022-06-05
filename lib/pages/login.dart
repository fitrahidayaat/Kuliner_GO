import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:kuliner_go/components/already_have_an_account_acheck.dart';
import 'package:kuliner_go/components/rounded_button.dart';
import 'package:kuliner_go/components/rounded_input_field.dart';
import 'package:kuliner_go/components/rounded_password_field.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;
  late String password;
  final FirebaseAuth auth = FirebaseAuth.instance;

  _signin(String email, String password) async {
    try {
      //Create Get Firebase User
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message.toString(), gravity: ToastGravity.TOP);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.blue,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.14,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.86,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                  ),
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
                        width: 270,
                      ),
                      Column(
                        children: <Widget>[
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
                        text: "Masuk",
                        press: () {
                          _signin(email, password);
                        },
                        height: screenHeight * 0.07,
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
                              onPressed: () {
                                signInWithGoogle();
                              },
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
                          Text("Tidak punya akun?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/signup");
                              },
                              child: Text("daftar disini")),
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
