import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuliner_go/components/menu_card.dart';
import 'package:kuliner_go/components/api_consumer.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuSelect extends StatefulWidget {
  final Restaurant restaurant;
  final name, phone, email, date, hour, people;
  const MenuSelect({
    Key? key,
    required this.restaurant,
    required this.name,
    required this.phone,
    required this.email,
    required this.date,
    required this.hour,
    required this.people,
  }) : super(key: key);

  @override
  State<MenuSelect> createState() => _MenuSelectState();
}

class _MenuSelectState extends State<MenuSelect> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        width: screenWidth * 0.9,
        margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          onPressed: () {},
          label: Text(
            "Pembayaran",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(3.0, 12.0, 3.0, 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => {Navigator.pop(context, true)},
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                      Text(
                        "Pilih Menu",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.transparent,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MenuCard(),
                      MenuCard(),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
