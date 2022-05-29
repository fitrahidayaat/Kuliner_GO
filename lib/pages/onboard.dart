import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:dots_indicator/dots_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _TutorialState();
}

class _TutorialState extends State<Onboard> {
  List<String> listImg = ["Onboard1.png", "Onboard2.png", "Onboard3.png"];
  List<String> listHeader = ["Pilih Restoran Favoritmu","Temukan harga dan review terbaik", "Reservasi tempat dan pesan makanan"];
  List<String> listSubheader = ["Bingung mau makan dimana? Kuliner.Go nyediain banyak restoran", "Bisa liat harga dan review makanannya dari pelanggan sebelumnya", "Ga perlu datang ke restoran buat reservasi tempat dan pesan makanannya"];
  List<String> listButton = ["Selanjutnya", "Selanjutnya", "Mari Jelajahi!"];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                      "assets/Logo.png",
                      width: 170.0,
                  ),
                  Text(
                    "Lewati",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    )
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/" + listImg[counter],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Text(
                    listHeader[counter],
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.values[5],
                      ),
                    )
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    listSubheader[counter],
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        height: 1.7,
                        color: Colors.grey[600],
                      ),
                    )
                  ),
                  SizedBox(height: 70.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "tes",
                      ),
                      TextButton(
                        // style: ButtonStyle(
                        //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //       RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(18.0),
                        //           side: BorderSide(color: Colors.red)
                        //       )
                        //   ),
                        //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        //   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        // ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )
                        ),

                        onPressed: () {
                          setState(() {
                            counter += 1;
                          });
                        },
                        child: Text(
                          listButton[counter],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
