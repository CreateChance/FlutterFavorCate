import 'package:favorcate/core/viewmodel/meal_filter_model.dart';
import 'package:favorcate/ui/shared/screen_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealFilterPageContent extends StatelessWidget {
  const MealFilterPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        Container(
            padding: EdgeInsets.all(20.rpx),
            alignment: Alignment.center,
            child: Text("展示你的选择", style: Theme.of(context).textTheme.displayMedium,)
        ),
        // choice list
        Expanded(
          child: Consumer<MealFilterVideModel>(
            builder: (ctx, filterVM, child) {
              return ListView(
                children: [
                  ListTile(
                    title: const Text("五谷蛋白"),
                    subtitle: const Text("不要五谷蛋白食物"),
                    trailing: Switch(value: filterVM.isGlutenFree, onChanged: (value) {
                      filterVM.isGlutenFree = value;
                    },),
                  ),
                  ListTile(
                    title: const Text("不含乳糖"),
                    subtitle: const Text("不要含乳糖食物"),
                    trailing: Switch(value: filterVM.isLactoseFree, onChanged: (value) {
                      filterVM.isLactoseFree = value;
                    },),
                  ),
                  ListTile(
                    title: const Text("普通素食者"),
                    subtitle: const Text("展示普通素食相关食物"),
                    trailing: Switch(value: filterVM.isVegetarian, onChanged: (value) {
                      filterVM.isVegetarian = value;
                    },),
                  ),
                  ListTile(
                    title: const Text("严格素食者"),
                    subtitle: const Text("展示严格素食相关食物"),
                    trailing: Switch(value: filterVM.isVegan, onChanged: (value) {
                      filterVM.isVegan = value;
                    },),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
