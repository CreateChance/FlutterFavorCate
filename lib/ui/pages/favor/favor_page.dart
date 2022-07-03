import 'package:favorcate/ui/pages/favor/favor_page_content.dart';
import 'package:flutter/material.dart';

class FavorPage extends StatelessWidget {
  const FavorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
        centerTitle: true,
      ),
      body: const FavorPageContent(),
    );
  }
}
