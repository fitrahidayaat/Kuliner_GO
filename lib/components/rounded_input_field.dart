import 'package:flutter/material.dart';
import 'package:kuliner_go/components/text_field_container.dart';
import 'package:kuliner_go/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final double ratioWidth;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.ratioWidth = 0.8,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      ratioWidth: ratioWidth,
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.0,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        style: GoogleFonts.poppins(
          fontSize: 14.0,
        ),
      ),
    );
  }
}
