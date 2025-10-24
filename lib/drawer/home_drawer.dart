import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_screen.dart';
import 'package:news_app/categories/category_model.dart';
import 'package:news_app/settings/settings_screen.dart';

class HomeDrawer extends StatelessWidget {
  final Function(Widget) onItemSelected;
  final Function(CategoryModel) onCategorySelected;

  const HomeDrawer({
    super.key,
    required this.onItemSelected,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppTheme.primary),
            child: Text(
              "News App!",
              style: TextStyle(
                color: AppTheme.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onItemSelected(
              CategoriesScreen(onCategorySelected: onCategorySelected),
            ),
            child: ListTile(
              leading: Icon(Icons.menu_outlined),
              title: Text(
                "Categories",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onItemSelected(const SettingsScreen()),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
