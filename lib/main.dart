import 'package:flutter/material.dart';
import 'package:food_ui/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/constans.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      color: KPrimary,
      home: MainScreen(),
    );
  }
// This widget is the root of your application.

}
