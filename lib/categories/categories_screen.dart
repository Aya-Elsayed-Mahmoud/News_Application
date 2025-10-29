import 'package:flutter/material.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/categories/category_model.dart';

import '../l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "/";

  const CategoriesScreen({super.key, required this.onCategorySelected});

  final void Function(CategoryModel category) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;


    final List<CategoryModel> categories = [
      CategoryModel(id: "sports",
          title: t.sports,
          image: "assets/images/sports.png",
          color: const Color(0xFFC91C22)),
      CategoryModel(id: "general",
          title: t.general,
          image: "assets/images/Politics.png",
          color: const Color(0xFF003E90)),
      CategoryModel(id: "science",
          title: t.science,
          image: "assets/images/science.png",
          color: const Color(0xFFF2D352)),
      CategoryModel(id: "health",
          title: t.health,
          image: "assets/images/health.png",
          color: const Color(0xFFED1E79)),
      CategoryModel(id: "entertainment",
          title: t.entertainment,
          image: "assets/images/environment.png",
          color: const Color(0xFF4882CF)),
      CategoryModel(id: "business",
          title: t.business,
          image: "assets/images/bussines.png",
          color: const Color(0xFFCF7E48)),
    ];
    final textColor = Theme
        .of(context)
        .brightness == Brightness.dark ? Colors.white : Colors.black;


    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.pickCategory,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: textColor,
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
                    onTap: () => onCategorySelected(category),
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
