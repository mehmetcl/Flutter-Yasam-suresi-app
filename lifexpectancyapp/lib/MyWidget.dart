import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
class MyColumn extends StatelessWidget {
  final String? gender;
  final IconData? myicon;
  MyColumn({ this.gender,this.myicon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget>[
        Icon(
          myicon,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gender.toString(),
          style:standartTextStyle
        ),
      ],
    );
  }
}


