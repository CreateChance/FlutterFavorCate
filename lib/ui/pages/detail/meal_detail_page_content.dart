import 'package:favorcate/core/models/meal.dart';
import 'package:favorcate/ui/shared/screen_fit.dart';
import 'package:flutter/material.dart';

class MealDetailPageContent extends StatelessWidget {
  final ModelMeal _meal;

  const MealDetailPageContent(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10.rpx),
        width: double.infinity,
        child: Column(
          children: [
            buildBannerImage(),
            buildMakeTitle(context, "制作材料"),
            buildMakeMaterial(context),
            buildMakeTitle(context, "步骤"),
            buildMakeSteps(context)
          ],
        ),
      ),
    );
  }

  // 横幅图片
  Widget buildBannerImage() {
    return Image.network(_meal.imageUrl);
  }

  // 制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(context, ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.rpx, horizontal: 10.rpx),
                child: Text(_meal.ingredients[index])
            ),
          );
        }
    ));
  }

  // 制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(context, ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _meal.steps.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text("#${index + 1}"),
          ),
          title: Text(_meal.steps[index]),
        );
      },
      separatorBuilder: (ctx, index) {
        return const Divider();
      },
    ));
  }

  // make title
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.rpx),
      child: Text(title, style: Theme.of(context).textTheme.displayLarge),
    );
  }

  Widget buildMakeContent(BuildContext context, Widget child) {
    return Container(
      padding: EdgeInsets.all(8.rpx),
      width: MediaQuery.of(context).size.width - 30.rpx,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12)
      ),
      child: child,
    );
  }
}
