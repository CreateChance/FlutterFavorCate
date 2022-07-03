import 'package:favorcate/ui/pages/favor/favor_page.dart';
import 'package:favorcate/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/";

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomePage(),
          FavorPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              label: "首页",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "收藏",
              icon: Icon(Icons.star)
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
