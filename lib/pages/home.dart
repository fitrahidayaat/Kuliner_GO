import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuliner_go/components/restaurant_card.dart';
import 'package:kuliner_go/components/api_consumer.dart';
import 'package:firebase_auth/firebase_auth.dart' as pengguna;
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// Save restaurant list from api_consumer.dart to a variable

// List<int> _list = <int>[];
//   int operator [](int i) => _list[i];
//   operator []=(int i, int value) => _list[i] = value;
//   add(int value) => _list.add(value);
//   remove(int index) => _list.removeAt(index);
class _HomeState extends State<Home> {
  late Future<List<Restaurant>> restaurantList;
  final pengguna.FirebaseAuth auth = pengguna.FirebaseAuth.instance;
  int _currentIndex = 0;
  Map data = {};
  void initState() {
    restaurantList = RestaurantApiConsumer().fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    final String? _email = auth.currentUser?.email;
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;
    double getProportionateScreenHeight(double inputHeight) {
      // 812 is the layout height that designer use
      return (inputHeight / 812.0) * screenHeight;
    }

    // Get the proportionate height as per screen size
    double getProportionateScreenWidth(double inputWidth) {
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth;
    }

    final tabs = [
      SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                    vertical: getProportionateScreenHeight(20),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lokasi terkini",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Bojongsoang",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Text(
                                      "Halo Anda",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.waving_hand_sharp,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                              child: Text(
                                "Kuliner.GO mempunyai lebih dari 1000 restoran",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10.0, 3.0, 0, 3.0),
                          width: screenWidth * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Cari restoran atau lokasi",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[300],
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(16),
                                vertical: getProportionateScreenHeight(16),
                              ),
                            ),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenWidth(20),
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 6.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.grey[350],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                icon: Icon(
                                  Icons.filter_list,
                                  size: 20,
                                ),
                                onPressed: () {},
                                label: Text("Filter"),
                                style: TextButton.styleFrom(
                                  textStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                  // backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.fromLTRB(
                                      18.0, 7.0, 18.0, 7.0),
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 208, 208, 208),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("Buka Sekarang"),
                                style: TextButton.styleFrom(
                                  textStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                  // backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.fromLTRB(
                                      30.0, 7.0, 30.0, 7.0),
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 208, 208, 208),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  textStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),

                                  // backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.fromLTRB(
                                      30.0, 7.0, 30.0, 7.0),
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 208, 208, 208),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text("\$\$\$\$"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Pilihan Kategori",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          width: screenWidth * 0.17,
                                          height: screenWidth * 0.17,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/rice.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8, 0, 0),
                                          child: Text(
                                            "Aneka nasi",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          width: screenWidth * 0.17,
                                          height: screenWidth * 0.17,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/drink.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8, 0, 0),
                                          child: Text(
                                            "Minuman",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          width: screenWidth * 0.17,
                                          height: screenWidth * 0.17,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/seafood.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8, 0, 0),
                                          child: Text(
                                            "Seafood",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          width: screenWidth * 0.17,
                                          height: screenWidth * 0.17,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/etc.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8, 0, 0),
                                          child: Text(
                                            "Lainnya",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Restoran terdekat",
                                style: GoogleFonts.poppins(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () => {},
                                child: Text(
                                  "Lihat semua",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // RestaurantCard(nama: "Warunk Mulya"),
                        // RestaurantCard(nama: "Mororejo"),
                        // RestaurantCard(nama: "Ayam Crisbar"),
                        // Make restaurant cards from restaurant list
                        FutureBuilder<List<Restaurant>>(
                          future: restaurantList,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: screenHeight * 0.6,
                                child: ListView.builder(
                                  // scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (_, index) => RestaurantCard(
                                      restaurant: snapshot.data![index]),
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      SafeArea(
        child: Container(
          color: Colors.white,
          height: screenHeight,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenHeight(20),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Text(
                                        "Favorit",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenWidth(20),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        FutureBuilder<List<Restaurant>>(
                          future: restaurantList,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: screenHeight * 0.75,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (_, index) => RestaurantCard(
                                      restaurant: snapshot.data![index]),
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SafeArea(
        child: Container(
          color: Colors.white,
          height: screenHeight,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenHeight(20),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      child: Text(
                                        "Riwayat",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight,
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenWidth(20),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(50),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Image(
                                  image: AssetImage("assets/cry.png"),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Kamu belum pernah pesan\ntempat di resto manapun",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 1.7,
                              ),
                            ),
                          ),
                          Text(
                            "Silahkan pesan restoran favoritmu\ndan kembali lagi kesini",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              height: 1.7,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              // height: screenHeight,
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: screenHeight * 0.2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bg.png"),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(25),
                          vertical: getProportionateScreenHeight(20),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(23.0, 16.0, 10.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Profil",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              label: Text(""),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: screenHeight * 0.15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          height: 0.08 * screenHeight,
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 0.15 - 55,
                        left: screenWidth / 2 - 55,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/profilePict.png"),
                                radius: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Magnus Carlsen",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          _email.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "23",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "Mengikuti",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[600],
                                    fontSize: 11.0,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              color: Colors.grey[100],
                              width: 1,
                            ),
                            Column(
                              children: [
                                Text(
                                  "23",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "Pengikut",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[600],
                                    fontSize: 11.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                width: screenWidth,
                                height: 35,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.chat_bubble,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            "Ulasan Saya",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey[335],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                width: screenWidth,
                                height: 35,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.account_balance_wallet_rounded,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            "Kartu / Rekening Bank",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey[335],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                width: screenWidth,
                                height: 35,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.notifications,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            "Notifikasi",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey[335],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                width: screenWidth,
                                height: 35,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.language,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            "Pilihan Bahasa",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey[335],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                width: screenWidth,
                                height: 35,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            "Beri rating",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey[335],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  auth.signOut().then((_) =>
                                      Navigator.pushNamed(context, "/login"));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 14.0, 20.0, 14.0),
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                child: Container(
                                  width: screenWidth * 0.75,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.exit_to_app),
                                      Text("Keluar"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ];
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[340],
        unselectedFontSize: 10,
        selectedFontSize: 11,
        iconSize: 24,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        unselectedLabelStyle: GoogleFonts.poppins(),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorit",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
