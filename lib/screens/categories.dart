import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/models/category.dart';
import 'package:ksiazkakucharska/providers/category_provider.dart';
import 'package:ksiazkakucharska/screens/add_meal.dart';
import 'package:ksiazkakucharska/screens/meals.dart';
import 'package:ksiazkakucharska/widgets/category_grid_item.dart';
import 'package:ksiazkakucharska/widgets/side_bar.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealScreen(
          category: category,
        ),
      ),
    );
  }

  void _addItem(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddMealScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    final List<Category> filteredByCategory = categoryProvider.categories;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black26,
        title: const Text(
          'Wybierz kategorię',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _addItem(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: const SideBarWidget(),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...filteredByCategory.map(
            (category) => CategoryGridItemWidget(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
          ),
        ],
      ),
    );
  }
}
