import 'package:favorcate/core/models/category.dart';
import 'package:favorcate/core/models/meal.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/widgets/widget_meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class MealPageContent extends StatelessWidget {
  final ModelCategory _category;

  const MealPageContent(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<MealViewModel, List<ModelMeal>>(
        selector: (ctx, mealVM) => mealVM.meals.where((meal) => meal.categories.contains(_category.id)).toList(),
        shouldRebuild: (prev, next) => !const ListEquality().equals(prev, next),
        builder: (ctx, meals, child) {
          return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                return WidgetMealItem(meals[index]);
              }
          );
        },
    );
  }
}
