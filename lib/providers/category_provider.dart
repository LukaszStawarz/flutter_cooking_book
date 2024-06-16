import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  final List<Category> categories = [];

  Future<void> getCategories() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final categoryReference =
        await firestore.collection('listOfCategories').get();

    for (final doc in categoryReference.docs) {
      Map<String, dynamic> documentData = doc.data();
      // documentData['id'] = doc.id;

      final Category category = Category.fromJson(documentData);
      categories.add(category);
    }
    notifyListeners();
  }
}
