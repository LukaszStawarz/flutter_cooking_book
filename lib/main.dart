import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/providers/category_provider.dart';
import 'package:ksiazkakucharska/providers/meal_provider.dart';
import 'package:ksiazkakucharska/providers/meal_settings_provider.dart';
import 'package:ksiazkakucharska/screens/categories.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MealsSettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MealProvider()..getMeals(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider()..getCategories(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(42, 44, 56, 1),
        ),
        home: const CategoriesScreen(),
      ),
    );
  }
}
