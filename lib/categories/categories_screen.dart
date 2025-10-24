import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/categories/category_model.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "/";

  CategoriesScreen({super.key, required this.onCategorySelected});

  final void Function(CategoryModel category) onCategorySelected;

  final List<CategoryModel> categories = [
    CategoryModel(
        id: "sports",
        title: "Sports",
        image: "assets/images/sports.png",
        color: AppTheme.blueGrey),
    CategoryModel(
        id: "politics",
        title: "Politics",
        image: "assets/images/Politics.png",
        color: AppTheme.blueGrey),
    CategoryModel(
        id: "science",
        title: "Science",
        image: "assets/images/science.png",
        color: AppTheme.blueGrey),
    CategoryModel(
        id: "health",
        title: "Health",
        image: "assets/images/health.png",
        color: AppTheme.blueGrey),
    CategoryModel(
        id: "environment",
        title: "Environment",
        image: "assets/images/environment.png",
        color: AppTheme.blueGrey),
    CategoryModel(
        id: "business",
        title: "Business",
        image: "assets/images/bussines.png",
        color: AppTheme.blueGrey),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick your category of interest",
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
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      onCategorySelected(category);
                    },
                    child: CategoryItem(category: category),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
