import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey[300],
    scaffoldBackgroundColor: kwhiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kwhiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarTextStyle: const TextTheme(displayLarge: TextStyle(color: kblackcolor)).displayLarge,
      titleTextStyle: const TextTheme(displayLarge: TextStyle(color: kblackcolor)).displayLarge,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: kblackcolor,
      onSecondary: kgreyColor1,
      background: Colors.grey[400],
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color.fromARGB(255, 24, 29, 34),
    scaffoldBackgroundColor: const Color.fromARGB(255, 24, 29, 34),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 24, 29, 34),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: const TextTheme(displayLarge: TextStyle(color: kwhiteColor)).displayLarge,
      titleTextStyle: const TextTheme(displayLarge: TextStyle(color: kwhiteColor)).displayLarge,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: kwhiteColor,
      onSecondary: kwhiteColor,
      background: const Color.fromARGB(255, 66, 63, 63),
    ),
  );
}
