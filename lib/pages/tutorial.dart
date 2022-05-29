import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "blablablaaaa",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    "lewati",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                    ),
                  )
                ],
              ),
              Image.asset("assets/Onboard1.png"),
              SizedBox(height: 50.0,),
              Text(
                "Pilih Restoran Favoritmu",
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                "Bingung mau makan dimana? kuliner.go nyediain banyak restoran",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 50.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () { },
                    child: Text('TextButton'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
