import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/categories/category_model.dart';

import '../home_screen.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "/";

  final List<CategoryModel> categories = [
    CategoryModel(title: "Sports", image: "assets/images/sports.png",color:AppTheme.blueGrey),
    CategoryModel(title: "Politics", image: "assets/images/Politics.png",color:AppTheme.blueGrey),
    CategoryModel(title: "science", image: "assets/images/science.png",color:AppTheme.blueGrey),
    CategoryModel(title: "health", image: "assets/images/health.png",color:AppTheme.blueGrey),
    CategoryModel(title: "environment", image: "assets/images/environment.png",color:AppTheme.blueGrey),
    CategoryModel(title: "bussines", image: "assets/images/bussines.png",color:AppTheme.blueGrey),
  ];

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      title: "News App!",
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick your category                                       of interest",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(category: categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
