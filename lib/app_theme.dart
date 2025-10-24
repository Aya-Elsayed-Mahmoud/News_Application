
import 'package:flutter/material.dart';

class AppTheme
{
static const Color primary=Color(0xFF39A552);
static const Color white=Color(0xFFFFFFFF);
static const Color black=Color(0xFF303030);
static const Color blueGrey=Color(0xFF42505C);
static const Color grey = Color(0xFF79828B);

  static ThemeData lightTheme=ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: primary,
    shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
         bottom: Radius.circular(30),
             ),
    ),
    iconTheme: IconThemeData(
      color: white
    ),
    titleTextStyle: TextStyle(
      color: white,
      fontSize: 22,
      fontWeight: FontWeight.w600
  ),
  ),
  textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
           fontWeight: FontWeight.w300,
              color: white,
           ),
    titleMedium: TextStyle(
      fontSize: 14,
        fontWeight: FontWeight.w100,
        color: blueGrey,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: black,
    ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: grey,
      ),
    ),

  
);


}
