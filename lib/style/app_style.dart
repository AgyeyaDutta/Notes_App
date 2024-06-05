import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Colors.white;
  static Color mainColor = Colors.black;
  static Color accentColor = Colors.blue.shade700;

//Different Colors for cards

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade200,
    Colors.pink.shade200,
    Colors.orange.shade200,
    Colors.yellow.shade200,
    Colors.blue.shade200,
    Colors.blueGrey.shade200,
  ]; 

//Settting Textstyle 
static TextStyle mainTitle = 
    GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);

static TextStyle mainContent = 
    GoogleFonts.nunito(fontSize: 16.0, fontWeight: FontWeight.normal);

static TextStyle dateTitle = 
    GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.w500);




}