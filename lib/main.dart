import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/screens/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(42, 44, 56, 1),
        ),
        home: CategoriesScreen());
  }
}
