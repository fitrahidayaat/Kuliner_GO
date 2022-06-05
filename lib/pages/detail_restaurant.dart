import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuliner_go/components/api_consumer.dart';
import 'package:kuliner_go/pages/reservation.dart';
import 'package:kuliner_go/pages/review.dart' as card;
import 'package:kuliner_go/components/review_card.dart';

class DetailRestaurant extends StatefulWidget {
  final Restaurant restaurant;

  const DetailRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  State<DetailRestaurant> createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  late Future<List<Review>> reviewList;
  void initState() {
    reviewList = ReviewApiConsumer().fetchReviews();
  }

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
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {},
      //       child: Icon(
      //         Icons.phone,
      //         color: Colors.white,
      //       ),
      //     ),
      //     Container(
      //       width: screenWidth * 0.9,
      //       margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
      //       child: FloatingActionButton.extended(
      //         backgroundColor: Colors.blue,
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Reservation()),
      //           );
      //         },
      //         label: Text("Pesan Tempat"),
      //       ),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(3.0, 12.0, 18.0, 14.0),
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
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.grey[400],
                            ),
                          ),
                          Icon(Icons.share),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Image(
                    image: NetworkImage(widget.restaurant.picture),
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: screenWidth * 0.93,
                  // height: 500,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${widget.restaurant.name}",
                                style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.blue[50],
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15.0),
                              child: Text(
                                "Buka sekarang",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Makanan Indonesia",
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 10.0),
                          child: Row(
                            children: [
                              Text(
                                "Detail Restoran",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 6, 10.0, 10.0),
                          child: Text(
                            "${widget.restaurant.detail}",
                            style: GoogleFonts.poppins(
                              fontSize: 13.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  // color: Colors.amber,
                                  height: 43.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time_filled_rounded,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: Text(
                                              "Jam Buka",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.keyboard_arrow_down,
                                          color: Colors.grey[350]),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  // color: Colors.amber,
                                  height: 43.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.attach_money_rounded,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: Text(
                                              "Kisaran Harga",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.keyboard_arrow_down,
                                          color: Colors.grey[350]),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  // color: Colors.amber,
                                  height: 43.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.restaurant_menu,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: Text(
                                              "Daftar Menu",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.keyboard_arrow_down,
                                          color: Colors.grey[350]),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  // color: Colors.amber,
                                  height: 43.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_rounded,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: Text(
                                              "Alamat Restoran",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.keyboard_arrow_down,
                                          color: Colors.grey[350]),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  // color: Colors.amber,
                                  height: 43.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.more_horiz_sharp,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: Text(
                                              "Fasilitas",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.keyboard_arrow_down,
                                          color: Colors.grey[350]),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 10.0,
                                        ),
                                        child: Text(
                                          "Ulasan Restoran",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                                  "${widget.restaurant.rating}/5",
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
                                                  "Berdasarkan ${widget.restaurant.reviews.length} Ulasan",
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
                                      builder: (context) => card.Review(),
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
                                            Icons.chat_rounded,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: Text(
                                              "Ulasan",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.keyboard_arrow_down,
                                          color: Colors.grey[350]),
                                    ],
                                  ),
                                ),
                              ),
                              FutureBuilder<List<Review>>(
                                future: reviewList,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return SizedBox(
                                      height: 600,
                                      child: ListView.builder(
                                        // scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (_, index) => ReviewCard(
                                            review: snapshot.data![index]),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
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
