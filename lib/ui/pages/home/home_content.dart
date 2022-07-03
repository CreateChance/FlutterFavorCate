import 'package:favorcate/core/services/data_repo.dart';
import 'package:favorcate/ui/pages/meal/meal_page.dart';
import 'package:favorcate/ui/shared/screen_fit.dart';
import 'package:flutter/material.dart';

import '../../../core/models/category.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelCategory>>(
        future: DataRepo.getCategoryData(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return const Center(child: Text("哦豁，请求挂了"));

          final categories = snapshot.data!;
          return GridView.builder(
              padding: EdgeInsets.all(10.rpx),
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.rpx,
                  mainAxisSpacing: 10.rpx,
                  childAspectRatio: 1.5
              ),
              itemBuilder: (ctx, index) {
                return _CategoryItem(categories[index]);
              }
          );
        }
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final ModelCategory _category;

  const _CategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: _category.resolvedColor,
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                colors: [
                  _category.resolvedColor.withOpacity(0.5),
                  _category.resolvedColor
                ]
            )
        ),
        alignment: Alignment.center,
        child: Text(_category.title, style: Theme.of(context).textTheme.displayLarge,),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(MealPage.routeName, arguments: _category);
      },
    );
  }
}
