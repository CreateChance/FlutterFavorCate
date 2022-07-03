import 'package:flutter/material.dart';

class MealFilterVideModel extends ChangeNotifier {
  // 有无五谷蛋白
  bool _isGlutenFree = false;
  // 有无乳糖
  bool _isLactoseFree = false;
  // 严格素食主义
  bool _isVegan = false;
  // 素食主义
  bool _isVegetarian = false;

  bool get isGlutenFree => _isGlutenFree;

  bool get isVegan => _isVegan;

  bool get isVegetarian => _isVegetarian;

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }
}