import 'package:favorcate/core/route/route.dart';
import 'package:favorcate/core/viewmodel/favormeal_view_model.dart';
import 'package:favorcate/core/viewmodel/meal_filter_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/shared/app_themes.dart';
import 'package:favorcate/ui/shared/screen_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => FavorMealViewModel()),
      ChangeNotifierProvider(create: (ctx) => MealFilterVideModel()),
      // 需要使用代理 provider，将 MealViewModel 依赖上 MealFilterVideModel
      // 当 MealFilterVideModel 发生改变的时候自动更新 MealViewModel 中的数据
      ChangeNotifierProxyProvider<MealFilterVideModel, MealViewModel>(
          // 调用这个回调的创建
          create: (ctx) => MealViewModel(),
          // 调用这个回调更新
          update: (ctx, filterVM, mealVM) {
            mealVM!.updateFilterVM(filterVM);
            return mealVM;
          }
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenFit.init();
    return MaterialApp(
      title: '美食广场',
      // about themes
      theme: FavorTheme.lightTheme,
      themeMode: ThemeMode.system,
      // about routes.
      initialRoute: FavorRoute.initialRoute,
      routes: FavorRoute.routes,
      onGenerateRoute: FavorRoute.generateRoute,
      onUnknownRoute: FavorRoute.unknownRoute,
    );
  }
}

