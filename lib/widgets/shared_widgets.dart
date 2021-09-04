import 'package:flutter/material.dart';
import 'package:food_ui/constants/constans.dart';



class BuildTitle extends StatelessWidget {
  final String text;
  final double fontSize;

  const BuildTitle({Key? key, required this.text, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KDefaultPadding ),
      child: Text(
        text,
        style: TextStyle(
            color: KBlack, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}