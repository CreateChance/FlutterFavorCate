import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavorMealViewModel extends ChangeNotifier {
  final List<ModelMeal> _favorMeals = [];

  List<ModelMeal> get favorMeals => _favorMeals;

  void addMeal(ModelMeal meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(ModelMeal meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  void updateMeal(ModelMeal meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFavor(ModelMeal meal) {
    return _favorMeals.contains(meal);
  }
}