import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/models/meal.dart';
import 'package:ksiazkakucharska/models/provider.dart';
import 'package:ksiazkakucharska/screens/meal_detail.dart';
import 'package:ksiazkakucharska/widgets/meat_item.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

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
    final provider = context.watch<MealsSettingsProvider>();

    final visibleList = meals
        .where((element) =>
            //            1         +     0  = 1
            (element.isGlutenFree && provider.glutenFreeFilterSet) ||
            (element.isLactoseFree && provider.lactoseFreeFilterSet) ||
            (element.isVegan && provider.veganFilterSet) ||
            (element.isVegetarian && provider.vegetarianFilterSet))
        .toList();

    print(meals.length);
    print('----');
    print(visibleList.length);

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'There is nothing here',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Select different category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
    if (visibleList.isNotEmpty) {
      content = ListView.builder(
        itemCount: visibleList.length,
        itemBuilder: (context, index) => MealItem(
            meal: visibleList[index],
            onSelectMeal: (visibleList) {
              _selectMeal(context, visibleList);
            }),
      );
    }

    if (visibleList.isEmpty && provider.isAnyFilterSet) {
      return Center(
        child: Text(
          'Tutaj nie ma dan weganskich',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
      );
    }

    if (meals.isNotEmpty && visibleList.isEmpty && !provider.isAnyFilterSet) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
          meal: meals[index],
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
        title: Text(title),
      ),
      body: content,
    );
  }
}
