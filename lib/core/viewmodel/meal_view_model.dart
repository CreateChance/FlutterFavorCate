import 'package:favorcate/core/services/data_repo.dart';
import 'package:favorcate/core/viewmodel/meal_filter_model.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealViewModel extends ChangeNotifier {
  List<ModelMeal> _meals = [];

  MealFilterVideModel? _filterVM;

  List<ModelMeal> get meals {
    if (_filterVM != null) {
      return _meals.where((meal) {
        // 根据设置过滤结果
        if (_filterVM!.isGlutenFree && !meal.isGlutenFree) return false;
        if (_filterVM!.isLactoseFree && !meal.isLactoseFree) return false;
        if (_filterVM!.isVegetarian && !meal.isVegetarian) return false;
        if (_filterVM!.isVegan && !meal.isVegan) return false;

        return true;
      }).toList();
    }
    return _meals;
  }

  MealViewModel() {
    DataRepo.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }

  void updateFilterVM(MealFilterVideModel filterVM) {
    this._filterVM = filterVM;
  }
}