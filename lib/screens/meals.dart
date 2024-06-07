import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/models/meal.dart';
import 'package:ksiazkakucharska/screens/meal_detail.dart';
import 'package:ksiazkakucharska/widgets/meat_item.dart';

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
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) => MealItem(
                meal: meals[index],
                onSelectMeal: (meal) {
                  _selectMeal(context, meal);
                },
              ));
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          foregroundColor: Colors.white,
          title: Text(title),
        ),
        body: content);
  }
}
