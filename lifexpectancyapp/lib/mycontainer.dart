import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyContainer extends StatelessWidget {
  final Color? mycolors;
  final Widget? child;
  void  Function()? myonPress;
  
  MyContainer({this.mycolors = Colors.white, required this.child, this.myonPress}) {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:myonPress,

      child: Container(
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: mycolors,
        ),
        child: child,
      ),
    );
  }
}