import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  List<String> listButton = ["Selanjutnya", "Selanjutnya", "Mari Jelajahi!"];
  int counter = 0;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                "assets/Logo.png",
                width: 170.0,
              ),
              Text("Lewati",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 120.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              counter = index;
            });
          },
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  "assets/Onboard1.png",
                  fit: BoxFit.cover,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                    child: Column(
                      children: <Widget>[
                        Text("Pilih Restoran Favoritmu",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.values[5],
                              ),
                            )),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                            "Bingung mau makan dimana? Kuliner.Go nyediain banyak restoran",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                height: 1.7,
                                color: Colors.grey[600],
                              ),
                            )),
                      ],
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  "assets/Onboard2.png",
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                    child: Column(
                      children: <Widget>[
                        Text("Temukan harga dan review terbaik",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.values[5],
                              ),
                            )),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                            "Bisa liat harga dan review makanannya dari pelanggan sebelumnya",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                height: 1.7,
                                color: Colors.grey[600],
                              ),
                            )),
                      ],
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  "assets/Onboard3.png",
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                    child: Column(
                      children: <Widget>[
                        Text("Reservasi tempat dan pesan makanan",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.values[5],
                              ),
                            )),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                            "Ga perlu datang ke restoran buat reservasi tempat dan pesan makanannya",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                height: 1.7,
                                color: Colors.grey[600],
                              ),
                            )),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        height: 120.0,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.black,
                  dotHeight: 12.0,
                  dotWidth: 12.0,
                ),
                onDotClicked: (index) {
                  setState(() {
                    counter = index;
                  });
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  )),
              onPressed: () {
                if (counter == 2) {
                  Navigator.pushNamed(context, '/login');
                }
                setState(() {
                  if (counter < 2) {
                    counter += 1;
                  }
                });

                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                listButton[counter],
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
