import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuliner_go/components/restaurant_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                                child: Text("Popularitas"),
                                style: TextButton.styleFrom(
                                  textStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                  // backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.fromLTRB(
                                      32.0, 7.0, 32.0, 7.0),
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
                                              fontSize: 12.0,
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
                                              fontSize: 12.0,
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
                                              fontSize: 12.0,
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
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w700,
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
                        RestaurantCard(nama: "Warunk Mulya"),
                        RestaurantCard(nama: "Mororejo"),
                        RestaurantCard(nama: "Ayam Crisbar"),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      Center(child: Text('Favorit')),
      Center(child: Text('Riwayat')),
      Center(child: Text('Profil')),
    ];
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[350],
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
