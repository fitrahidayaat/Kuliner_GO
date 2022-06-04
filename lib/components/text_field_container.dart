import 'package:flutter/material.dart';
import 'package:kuliner_go/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double ratioWidth;
  const TextFieldContainer({
    Key? key,
    this.ratioWidth = 0.8,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * ratioWidth,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
