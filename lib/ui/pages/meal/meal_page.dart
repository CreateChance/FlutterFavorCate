import 'package:favorcate/core/models/category.dart';
import 'package:favorcate/ui/pages/meal/meal_content.dart';
import 'package:flutter/material.dart';

class MealPage extends StatelessWidget {
  static const String routeName = "/meal";

  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取传入数据
    final category = ModalRoute.of(context)!.settings.arguments as ModelCategory;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: MealPageContent(category),
    );
  }
}
