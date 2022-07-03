import 'package:favorcate/core/models/meal.dart';
import 'package:favorcate/core/viewmodel/favormeal_view_model.dart';
import 'package:favorcate/ui/pages/detail/meal_detail_page.dart';
import 'package:favorcate/ui/shared/screen_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetMealItem extends StatelessWidget {
  final ModelMeal _meal;

  const WidgetMealItem(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.rpx),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)
                  ),
                  child: Image.network(_meal.imageUrl, width: double.infinity, height: 200.rpx, fit:BoxFit.cover,),
                ),
                // title
                Positioned(
                  right: 10.rpx,
                  bottom: 10.rpx,
                  child: Container(
                    width: 300.rpx,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(_meal.title, style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.rpx),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // time
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      SizedBox(width: 3.rpx,),
                      Text("${_meal.duration} min", style: Theme.of(context).textTheme.bodySmall,)
                    ],
                  ),
                  // person
                  Row(
                    children: [
                      const Icon(Icons.restaurant),
                      SizedBox(width: 3.rpx,),
                      Text(_meal.complexityName, style: Theme.of(context).textTheme.bodySmall,)
                    ],
                  ),
                  // like
                  Consumer<FavorMealViewModel>(
                      builder: (ctx, favorVM, child) {
                        final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
                        final favorColor = favorVM.isFavor(_meal) ? Theme.of(context).primaryColor : Colors.black;
                        return GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.rpx),
                            child: Row(
                              children: [
                                Icon(iconData, color: favorColor,),
                                SizedBox(width: 3.rpx,),
                                Text(favorVM.isFavor(_meal) ? "已收藏" : "未收藏", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: favorColor),)
                              ],
                            ),
                          ),
                          onTap: () {
                            favorVM.updateMeal(_meal);
                          },
                        );
                      }
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(MealDetailPage.routeName, arguments: _meal);
      },
    );
  }
}
