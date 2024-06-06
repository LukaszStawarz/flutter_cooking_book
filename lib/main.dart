import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ksiazkakucharska/kategorie.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xff34A853),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(theme: theme, home: CategoriesScreen());
  }
}
