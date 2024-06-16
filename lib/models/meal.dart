import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

enum Complexity {
  proste,
  wymagajace,
  trudne,
}

enum Affordability {
  tanie,
  kosztowne,
  drogie,
}

@JsonSerializable()
class Meal {
  Meal({
    required this.id,
    required this.categories,
    required this.title,

    // FilePicker/ ImagePicker
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
