import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuliner_go/components/api_consumer.dart';
import 'package:kuliner_go/pages/reservation.dart';
// import 'package:kuliner_go/pages/review.dart' as card;

class ReviewCard extends StatelessWidget {
  final restaurant;

  const ReviewCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(this.restaurant['picture']),
                            radius: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: Text(
                                    "${this.restaurant['username']}",
                                    style: GoogleFonts.poppins(),
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
                  SizedBox(height: 7.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${this.restaurant['comment']}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
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
