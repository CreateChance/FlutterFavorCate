import 'package:favorcate/ui/pages/filter/meal_filter_page_content.dart';
import 'package:flutter/material.dart';

class MealFilterPage extends StatelessWidget {
  static const String routeName = "/filter";

  const MealFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食过滤"),
        centerTitle: true,
      ),
      body: const MealFilterPageContent()
    );
  }
}
