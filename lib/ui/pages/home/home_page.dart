import 'package:favorcate/ui/pages/filter/meal_filter_page.dart';
import 'package:favorcate/ui/pages/home/home_content.dart';
import 'package:favorcate/ui/shared/screen_fit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食广场"),
        centerTitle: true,
      ),
      body: const HomeContent(),
      drawer: Drawer(
        child: Column(
          children: [
            buildDrawerHeader(context),
            buildListTile(const Icon(Icons.restaurant), "进餐", () {
              // 默认当前 drawer 就是在导航栈的栈顶，因此直接 pop 就能退出 drawer
              Navigator.of(context).pop();
            }),
            buildListTile(const Icon(Icons.settings), "过滤", () {
              Navigator.of(context).pushNamed(MealFilterPage.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.rpx,
      color: Theme.of(context).accentColor,
      margin: EdgeInsets.only(bottom: 20.rpx),
      alignment: const Alignment(0, 0.5),
      child: Text("开始动手", style: Theme.of(context).textTheme.displayLarge,),
    );
  }
  
  Widget buildListTile(Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        handler();
      },
    );
  }
}
