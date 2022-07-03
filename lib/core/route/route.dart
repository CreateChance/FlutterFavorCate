import 'package:favorcate/ui/pages/detail/meal_detail_page.dart';
import 'package:favorcate/ui/pages/filter/meal_filter_page.dart';
import 'package:favorcate/ui/pages/meal/meal_page.dart';
import 'package:flutter/material.dart';

import '../../ui/pages/main/main_page.dart';

class FavorRoute {
  static const String initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName : (ctx) => const MainPage(),
    MealPage.routeName : (ctx) => const MealPage(),
    MealDetailPage.routeName : (ctx) => const MealDetailPage(),
    MealFilterPage.routeName : (ctx) => const MealFilterPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == MealFilterPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return MealFilterPage();
          },
        fullscreenDialog: true,
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}