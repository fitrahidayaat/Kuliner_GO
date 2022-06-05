import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuliner_go/pages/add_review.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
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

    return Scaffold(
      backgroundColor: Colors.white,
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
                        "Ulasan",
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(17),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 12.0),
                                                child: Text(
                                                  "4.7/5",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0,
                                                        horizontal: 12.0),
                                                child: Text(
                                                  "Berdasarkan 471 Ulasan",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12.0,
                                                    color: Colors.grey[600],
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 25.0,
                                            ),
                                            width: 75,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/rating.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddReview(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 43.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.add_comment,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: Text(
                                              "Tambah Ulasan",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.grey[350],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Ulasan Pengguna",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(56, 36),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "5",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(56, 36),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "5",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(56, 36),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "5",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(56, 36),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "5",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        backgroundColor: Colors.blue,
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(56, 36),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "5",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(17),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(
                                                        "assets/reviewprofilepict1.png",
                                                      ),
                                                      radius: 20,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 5.0,
                                                            ),
                                                            child: Text(
                                                              "Magzy Bogues",
                                                              style: GoogleFonts
                                                                  .poppins(),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 14.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '"Penjual sangat ramah"',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(17),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(
                                                        "assets/reviewprofilepict1.png",
                                                      ),
                                                      radius: 20,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 5.0,
                                                            ),
                                                            child: Text(
                                                              "Magzy Bogues",
                                                              style: GoogleFonts
                                                                  .poppins(),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 14.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '"Penjual sangat ramah"',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
