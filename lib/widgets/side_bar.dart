import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/providers/meal_settings_provider.dart';
import 'package:provider/provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Color.fromRGBO(33, 32, 44, 1),
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(27, 26, 37, 0.922),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_rounded,
                  size: 30,
                  color: Colors.white54,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Dostosuj swoje dania :)',
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
          FilterWidget(),
        ],
      ),
    );
  }
}

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final _glutenFreeFilterSet = false;
  final _lactoseFreeFilterSet = false;
  final _veganFilterSet = false;
  final _vegetarianFilterSet = false;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MealsSettingsProvider>();
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) return;
        Navigator.of(context).pop({
          Filter.glutenFree: _glutenFreeFilterSet,
          Filter.lactoseFree: _lactoseFreeFilterSet,
          Filter.vegan: _veganFilterSet,
          Filter.vegetarian: _vegetarianFilterSet,
        });
      },
      child: Column(
        children: [
          SwitchListTile(
            value: provider.glutenFreeFilterSet,
            onChanged: (isChecked) {
              provider.glutenFreeFilterSet = isChecked;
            },
            title: const Text(
              'Gluten-free',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Pokaż wszystkie dania, które są bez glutenu.',
              style: TextStyle(color: Colors.white38),
            ),
          ),
          SwitchListTile(
            value: provider.lactoseFreeFilterSet,
            onChanged: (isChecked) {
              provider.lactoseFreeFilterSet = isChecked;
            },
            title: const Text(
              'Lactose-free',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Pokaż wszystkie dania, które są bez laktozy.',
              style: TextStyle(color: Colors.white38),
            ),
          ),
          SwitchListTile(
            value: provider.veganFilterSet,
            onChanged: (isChecked) {
              provider.veganFilterSet = isChecked;
            },
            title: const Text(
              'Vegan',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Pokaż wszystkie wegańskie dania.',
              style: TextStyle(color: Colors.white38),
            ),
          ),
          SwitchListTile(
            value: provider.vegetarianFilterSet,
            onChanged: (isChecked) {
              provider.vegetarianFilterSet = isChecked;
            },
            title: const Text(
              'Vegatarian',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Pokaż wszystkie wegetariańskie dania.',
              style: TextStyle(color: Colors.white38),
            ),
          )
        ],
      ),
    );
  }
}
