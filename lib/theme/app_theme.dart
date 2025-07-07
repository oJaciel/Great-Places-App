import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo; 
  static const Color secondaryColor = Colors.amber;
  static const Color accentColor = Color(0xFF3C4D5E); // Azul petróleo
  static const Color backgroundColor = Color(0xFFF4F6F7); // Fundo claro
  static const Color greyLight = Color(0xFFBDBDBD); // Cinza claro
  static const Color grey = Color(0xFF9E9E9E); // Cinza médio
  static const Color textColor = Color(0xFF3C4D5E); // Igual ao azul petróleo

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,

      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),



      buttonTheme: ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        labelStyle: TextStyle(color: accentColor, fontWeight: FontWeight.w600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: grey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: primaryColor
      )
    );
  }
}
