import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/models/meal.dart';

class MealProvider extends ChangeNotifier {
  final List<Meal> meals = [];

  bool isFetching = false;
  bool isAdding = false;

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

    await Future.delayed(const Duration(seconds: 2));
    isFetching = false;
    notifyListeners();
  }

  Future<void> addMeal(Meal meal) async {
    isAdding = true;
    notifyListeners();
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final mealsReference =
        await firestore.collection('meals').add(meal.toJson());
    isAdding = false;
    notifyListeners();

    getMeals();
  }

  Future<void> updateMeal(Meal meal) async {
    isAdding = true;
    notifyListeners();
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final mealsReference = await firestore.collection('meals').doc(meal.id).set(
          meal.toJson(),
          SetOptions(
            merge: true,
          ),
        );
    isAdding = false;
    notifyListeners();

    getMeals();
  }

  Future<String> addPhoto(File file) async {
    final storage = FirebaseStorage.instance;
    print('hallo');
    final reference = storage
        .ref()
        .child('images')
        .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
    print(reference);
    final x = await reference.putFile(file);
    print('Haallo ${x}');
    return await reference.getDownloadURL();
  }
}
