import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuliner_go/components/rounded_input_field.dart';
import 'package:intl/intl.dart';
import 'package:kuliner_go/components/text_field_container.dart';
import 'package:kuliner_go/components/api_consumer.dart';
import 'package:url_launcher/url_launcher.dart';

class Reservation extends StatefulWidget {
  final Restaurant restaurant;
  const Reservation({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  late String name, phone, email, date, hour;
  final Uri _url = Uri.parse(
      "https://api.whatsapp.com/send?phone=6281314494505&text=Kak+mau+mau+pesan+tas+...+dong");

  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  late int counter = 0;
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    timeinput.text = "";
    counter = 0;
    super.initState();
  }

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        width: screenWidth * 0.9,
        margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          onPressed: _launchUrl,
          label: Text(
            "Hubungi via WA",
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
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                      Text(
                        "Pesan Tempat",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: const Icon(
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
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              child: Image(
                                image: NetworkImage(widget.restaurant.picture),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${widget.restaurant.name}",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: Colors.grey[300],
                                        ),
                                        Text(
                                          "${widget.restaurant.location}",
                                          style: GoogleFonts.poppins(
                                            color: Colors.grey[500],
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
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Data Pemesan",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "Pastikan nomor telepon dan email sudah benar",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedInputField(
                            ratioWidth: 0.846,
                            hintText: "Your Name",
                            icon: Icons.person_rounded,
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedInputField(
                            ratioWidth: 0.846,
                            hintText: "Phone Number",
                            icon: Icons.phone_rounded,
                            onChanged: (value) {
                              phone = value;
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedInputField(
                            ratioWidth: 0.846,
                            hintText: "Your Email",
                            icon: Icons.email_rounded,
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pilih Tanggal dan Jam ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "Tentuin kapan kamu mau pesan tempatnya",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.grey[600],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextFieldContainer(
                        ratioWidth: 0.846,
                        child: TextField(
                          controller:
                              dateinput, //editing controller of this TextField
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Tanggal",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                            icon: const Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.blue,
                            ),
                          ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('EEEE, d MMMM').format(pickedDate);
                              setState(() {
                                dateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            }
                          },
                        ),
                      ),
                      TextFieldContainer(
                        ratioWidth: 0.846,
                        child: TextField(
                          controller:
                              timeinput, //editing controller of this TextField
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Jam",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                            icon: const Icon(
                              Icons.timer_rounded,
                              color: Colors.blue,
                            ),
                          ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.

                              String formattedTime =
                                  DateFormat('jm').format(parsedTime);

                              //DateFormat() is from intl package, you can format the time on any pattern you need.

                              setState(() {
                                timeinput.text =
                                    formattedTime; //set the value of text field.
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jumlah Orang",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "Ada berapa orang yang mau ikut makan?",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.grey[600],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[100],
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (counter > 0) {
                                  setState(() {
                                    counter--;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.groups,
                                  color: Colors.grey[500],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "${counter}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Orang",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
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
      ),
    );
  }
}
