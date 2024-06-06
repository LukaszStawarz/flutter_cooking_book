import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/data/dummy_data.dart';
import 'package:ksiazkakucharska/models/category.dart';
import 'package:ksiazkakucharska/screens/meals.dart';
import 'package:ksiazkakucharska/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: const Text(
          'Wybierz kategorię',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...listOfCategories.map(
            (category) => CategoryGridItemWidget(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
          ),
          // for (final category in listOfCategories)
          //   CategoryGridItemWidget(category: category)
        ],
      ),
    );
  }
}
