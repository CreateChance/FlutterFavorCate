import 'dart:convert';
import 'dart:io';

import 'package:favorcate/core/models/category.dart';
import 'package:favorcate/core/models/meal.dart';
import 'package:flutter/services.dart';

import '../network/http_request.dart';

class DataRepo {
  static Future<List<ModelCategory>> getCategoryData() async {
    final result = await FavorHttpRequest.request("/category");
    // 加载 json 文件
    // String jsonString = await rootBundle.loadString("json/category.json");
    // // 将 json string 转为 map list
    // final result = json.decode(jsonString);
    // 将 map 中的内容转为一个一个的对象
    final categories = result["category"];
    List<ModelCategory> modelCategories = [];
    for (var jsonMap in categories) {
      modelCategories.add(ModelCategory.fromJson(jsonMap));
    }
    return modelCategories;
  }

  static Future<List<ModelMeal>> getMealData() async {
    final result = await FavorHttpRequest.request("/meal");
    final meals = result["meal"];
    List<ModelMeal> modelMeals = [];
    for (var jsonMap in meals) {
      modelMeals.add(ModelMeal.fromJson(jsonMap));
    }
    return modelMeals;
  }
}