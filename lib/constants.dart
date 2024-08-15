import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  //Primary color
  static var primaryColor = const Color.fromARGB(255, 0, 87, 31);
  static var white = Color.fromARGB(255, 255, 255, 255);
  static var blackColor = Colors.black54;

  //Onboarding texts
  static var titleOne = "Learn more about plants";
  static var descriptionOne = "Read how to care for plants in our rich plants guide.";
  static var titleTwo = "Find a plant lover friend";
  static var descriptionTwo = "Are you a plant lover? Connect with other plant lovers.";
  static var titleThree = "Plant a tree, green the Earth";
  static var descriptionThree = "Find almost all types of plants that you like here.";
}

TextTheme defaultText = TextTheme(
    displayLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 96),
    displayMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 60),
    displaySmall: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 48),
    headlineMedium: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 34),
    headlineSmall: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 24),
    titleLarge: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 20),
    bodyLarge: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    titleMedium: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal),
    titleSmall: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w400),
    labelLarge: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.normal));