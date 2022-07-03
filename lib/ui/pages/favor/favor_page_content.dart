import 'package:favorcate/core/viewmodel/favormeal_view_model.dart';
import 'package:favorcate/ui/widgets/widget_meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavorPageContent extends StatelessWidget {
  const FavorPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorMealViewModel>(
        builder: (ctx, favorVM, child) {
          if (favorVM.favorMeals.isEmpty) {
            return Center(child: Text("暂无收藏", style: Theme.of(context).textTheme.displayLarge,),);
          }
          return ListView.builder(
            itemCount: favorVM.favorMeals.length,
            itemBuilder: (itemCtx, index) {
              return WidgetMealItem(favorVM.favorMeals[index]);
            }
          );
        }
    );
  }
}
