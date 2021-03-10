import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppThemes {
  static final appThemeData = {
    // Light Theme
    AppTheme.lightTheme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: "productsansbold", fontSize: 22, color: Colors.black),
          headline2: TextStyle(
              fontSize: 18, fontFamily: "productsansbold", color: Colors.black),
          bodyText1: TextStyle(
              fontSize: 16, fontFamily: "productsansbold", color: Colors.black),
          bodyText2: TextStyle(
              fontSize: 14, fontFamily: "productsansbold", color: Colors.black),
        ),
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        disabledColor: Colors.grey,
        focusColor: Colors.green.withOpacity(0.8),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: "productsansbold", fontSize: 22, color: Colors.black),
        headline2: TextStyle(
            fontFamily: "productsansbold", fontSize: 20, color: Colors.black),
        headline3: TextStyle(
            fontFamily: "productsansbold", fontSize: 18, color: Colors.black),
        headline4: TextStyle(
            fontFamily: "productsansbold", fontSize: 16, color: Colors.black),
        bodyText1: TextStyle(fontFamily: "productsans", fontSize: 14),
        bodyText2: TextStyle(fontFamily: "productsans", fontSize: 12),
      ),
    ),

    // Dark Theme
    AppTheme.darkTheme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      disabledColor: Colors.grey,
      backgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.black,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: "productsansbold", fontSize: 22, color: Colors.white),
          headline2: TextStyle(
              fontSize: 18, fontFamily: "productsansbold", color: Colors.white),
          bodyText1: TextStyle(
              fontSize: 16, fontFamily: "productsansbold", color: Colors.white),
          bodyText2: TextStyle(
              fontSize: 14, fontFamily: "productsansbold", color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        disabledColor: Colors.grey,
        focusColor: Colors.green.withOpacity(0.8),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: "productsansbold", fontSize: 22, color: Colors.white),
        headline2: TextStyle(
            fontFamily: "productsansbold", fontSize: 20, color: Colors.white),
        headline3: TextStyle(
            fontFamily: "productsansbold", fontSize: 18, color: Colors.white),
        headline4: TextStyle(
            fontFamily: "productsansbold", fontSize: 16, color: Colors.white),
        bodyText1: TextStyle(fontFamily: "productsans", fontSize: 14),
        bodyText2: TextStyle(fontFamily: "productsans", fontSize: 12),
      ),
    )
  };
}
