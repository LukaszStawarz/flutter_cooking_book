import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

enum Complexity {
  proste,
  wymagajace,
  trudne,
}

class ComplexityMapper {
  static Complexity mapStringToComplexity(String complexity) {
    if (complexity == 'proste') {
      return Complexity.proste;
    }

    if (complexity == 'wymagajace') {
      return Complexity.wymagajace;
    }

    if (complexity == 'trudne') {
      return Complexity.trudne;
    }

    return Complexity.proste;
  }
}

enum Affordability {
  tanie,
  kosztowne,
  drogie,
}

class AffordabilityMapper {
  static Affordability mapStringToAfforability(String affordability) {
    if (affordability == 'tanie') {
      return Affordability.tanie;
    }

    if (affordability == 'kosztowne') {
      return Affordability.kosztowne;
    }

    if (affordability == 'drogie') {
      return Affordability.drogie;
    }

    return Affordability.tanie;
  }
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
