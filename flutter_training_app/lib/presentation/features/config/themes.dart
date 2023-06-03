import 'package:flutter/material.dart';

ThemeData lightColorScheme = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Color(0xFFD31919),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    toolbarHeight: 200,
    centerTitle: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(100))),
  ),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
      color: Color(0xFFBB271A),
    )),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFD31919)),
  )),
);

// buttonColorCode = [#D31919,#EE3333]
// appBar = [#A20E0E,#E61616]