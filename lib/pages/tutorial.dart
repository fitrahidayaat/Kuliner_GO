import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:dots_indicator/dots_indicator.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  List<String> list_img = ["Onboard1.png", "Onboard2.png", "Onboard3.png"];
  List<String> list_header = ["Pilih Restoran Favoritmu","Temukan harga dan review terbaik", "Reservasi tempat dan pesan makanan"];
  List<String> list_subheader = ["Bingung mau makan dimana? Kuliner.Go nyediain banyak restoran", "Bisa liat harga dan review makanannya dari pelanggan sebelumnya", "Ga perlu datang ke restoran buat reservasi tempat dan pesan makanannya"];
  List<String> list_button = ["Selanjutnya", "Selanjutnya", "Mari Jelajahi!"];
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
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                      "assets/Logo.png",
                      width: 170.0,
                  ),
                  Text(
                    "lewati",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/" + list_img[counter],

            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    list_header[counter],
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    list_subheader[counter],
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 70.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "tes",
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),

                        onPressed: () {
                          setState(() {
                            counter += 1;
                          });
                        },
                        child: Text(list_button[counter]),
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
