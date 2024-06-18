import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/models/category.dart';
import 'package:ksiazkakucharska/models/meal.dart';
import 'package:ksiazkakucharska/providers/meal_settings_provider.dart';
import 'package:ksiazkakucharska/screens/meal_detail.dart';
import 'package:ksiazkakucharska/widgets/meat_item.dart';
import 'package:provider/provider.dart';

import '../providers/meal_provider.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.category,
  });

  final Category category;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<MealsSettingsProvider>();
    final mealsProvider = context.watch<MealProvider>();
    final List<Meal> filteredByCategoryMeals = mealsProvider.meals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    final mealsFilteredBySettings = filteredByCategoryMeals
        .where((element) =>
            //            1         +         0     =      1
            (element.isGlutenFree && settingsProvider.glutenFreeFilterSet) ||
            (element.isLactoseFree && settingsProvider.lactoseFreeFilterSet) ||
            (element.isVegan && settingsProvider.veganFilterSet) ||
            (element.isVegetarian && settingsProvider.vegetarianFilterSet))
        .toList();

    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'There is nothing here',
            style: TextStyle(color: Colors.white54, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Select different category!',
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
    );
    if (mealsFilteredBySettings.isNotEmpty) {
      content = ListView.builder(
        itemCount: mealsFilteredBySettings.length,
        itemBuilder: (context, index) => MealItem(
            meal: mealsFilteredBySettings[index],
            onSelectMeal: (selectedMeal) {
              _selectMeal(context, selectedMeal);
            }),
      );
    }

    if (mealsFilteredBySettings.isEmpty && settingsProvider.isAnyFilterSet) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          foregroundColor: Colors.white,
          title: Text(
            category.title,
          ),
        ),
        body: content,
      );
    }

    if (filteredByCategoryMeals.isNotEmpty &&
        mealsFilteredBySettings.isEmpty &&
        !settingsProvider.isAnyFilterSet) {
      content = ListView.builder(
        itemCount: filteredByCategoryMeals.length,
        itemBuilder: (context, index) => MealItem(
          meal: filteredByCategoryMeals[index],
          onSelectMeal: (meal) {
            _selectMeal(context, meal);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
        title: Text(
          category.title,
        ),
      ),
      body: mealsProvider.isFetching
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : content,
    );
  }
}
