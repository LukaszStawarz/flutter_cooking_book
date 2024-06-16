import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/providers/category_provider.dart';
import 'package:ksiazkakucharska/providers/meal_provider.dart';
import 'package:ksiazkakucharska/providers/meal_settings_provider.dart';
import 'package:ksiazkakucharska/screens/add_meal.dart';
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
    // final firestore = FirebaseFirestore.instance;

    // for (int i = 0; i < listOfCategories.length; i++) {
    //   print('timesCalled$i');
    //   firestore
    //       .collection('listOfCategories')
    //       .add(listOfCategories[i].toJson());
    // }

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
        home: AddMealScreen(),
        //const CategoriesScreen(),
      ),
    );
  }
}
