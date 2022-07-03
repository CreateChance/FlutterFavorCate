import 'package:favorcate/core/models/meal.dart';
import 'package:favorcate/core/viewmodel/favormeal_view_model.dart';
import 'package:favorcate/ui/pages/detail/meal_detail_page_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealDetailPage extends StatelessWidget {
  static const String routeName = "/meal/detail";

  const MealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as ModelMeal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: MealDetailPageContent(meal),
      floatingActionButton: Consumer<FavorMealViewModel>(
        builder: (ctx, favorVM, child) {
          final iconData = favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
          final iconColor = favorVM.isFavor(meal) ? Theme.of(context).primaryColor : Colors.black;

          return FloatingActionButton(
            child: Icon(iconData, color: iconColor,),
            onPressed: () {
              favorVM.updateMeal(meal);
            },
          );
        },
      ),
    );
  }
}
