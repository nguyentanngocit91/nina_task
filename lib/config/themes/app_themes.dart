import 'package:flutter/material.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightAccentColor = Colors.blueGrey.shade400;
  static Color lightParticlesColor = const Color(0x44948282);

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkAccentColor = Colors.grey.shade500;
  static Color darkParticlesColor = const Color(0x441C2A3D);

  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    backgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    primaryColorDark: darkParticlesColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: darkParticlesColor,
      hintStyle: TextStyle(color: darkAccentColor),
      labelStyle: TextStyle(color: Colors.blue),
      focusColor: Colors.grey.shade200,
    ),
    backgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
