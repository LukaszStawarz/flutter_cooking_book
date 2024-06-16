import 'package:flutter/material.dart';

class MealsSettingsProvider with ChangeNotifier {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _veganFilterSet = false;
  bool _vegetarianFilterSet = false;

  bool get glutenFreeFilterSet => _glutenFreeFilterSet;
  bool get lactoseFreeFilterSet => _lactoseFreeFilterSet;
  bool get veganFilterSet => _veganFilterSet;
  bool get vegetarianFilterSet => _vegetarianFilterSet;

  set glutenFreeFilterSet(bool value) {
    _glutenFreeFilterSet = value;
    notifyListeners();
  }

  set lactoseFreeFilterSet(bool value) {
    _lactoseFreeFilterSet = value;
    notifyListeners();
  }

  set veganFilterSet(bool value) {
    _veganFilterSet = value;
    notifyListeners();
  }

  set vegetarianFilterSet(bool value) {
    _vegetarianFilterSet = value;
    notifyListeners();
  }

  bool get isAnyFilterSet =>
      _glutenFreeFilterSet ||
      _lactoseFreeFilterSet ||
      _veganFilterSet ||
      _vegetarianFilterSet;
}
