import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/models/meal.dart';

class MealProvider extends ChangeNotifier {
  final List<Meal> meals = [];

  bool isFetching = false;

  Future<void> getMeals() async {
    meals.clear();
    isFetching = true;
    notifyListeners();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final mealsReference = await firestore.collection('meals').get();

    for (final doc in mealsReference.docs) {
      Map<String, dynamic> documentDataWithoutId = doc.data();
      documentDataWithoutId['id'] = doc.id;
      final Meal meal = Meal.fromJson(documentDataWithoutId);
      meals.add(meal);
    }

    await Future.delayed(Duration(seconds: 2));
    isFetching = false;
    notifyListeners();
  }

  Future<void> addMeal(Meal meal) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final mealsReference =
        await firestore.collection('meals').add(meal.toJson());

    getMeals();
  }
}
