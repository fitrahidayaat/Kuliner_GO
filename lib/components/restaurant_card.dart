import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuliner_go/pages/detail_restaurant.dart';
import 'package:kuliner_go/components/api_consumer.dart';
import 'package:http/http.dart' as http;

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
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

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailRestaurant(
                      restaurant: this.restaurant,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Colors.grey[400],
                elevation: 0,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Image(
                        image: NetworkImage(this.restaurant.picture),
                        width: screenWidth * 0.225),
                  ),
                  Container(
                    height: screenWidth * 0.225,
                    width: screenWidth * 0.52,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${this.restaurant.name}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30.0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                  ),
                                  Text(
                                    "${this.restaurant.rating}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                    child: Icon(
                                      Icons.location_on,
                                      size: 20.0,
                                    ),
                                  ),
                                  Text(
                                    "0,6 km",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$\$\$\$",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 7.0, 0),
                              child: Icon(
                                Icons.access_time_filled_rounded,
                                size: 20.0,
                                color: Colors.grey[350],
                              ),
                            ),
                            Text(
                              "Buka sekarang",
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
    );
  }
}
