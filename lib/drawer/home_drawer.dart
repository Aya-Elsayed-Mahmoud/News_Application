import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_screen.dart';
import 'package:news_app/categories/category_model.dart';
import 'package:news_app/settings/settings_screen.dart';

import '../l10n/app_localizations.dart';

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
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;

    return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppTheme.primary),
            child: Text(
              "${t.appTitle}!",
              style: const TextStyle(
                color: AppTheme.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.menu_outlined, color: textColor),
            title: Text(
              t.categories,
              style: theme.textTheme.headlineSmall?.copyWith(color: textColor),
            ),
            onTap: () => onItemSelected(
              CategoriesScreen(onCategorySelected: onCategorySelected),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: textColor),
            title: Text(
              t.settings,
              style: theme.textTheme.headlineSmall?.copyWith(color: textColor),
            ),
            onTap: () => onItemSelected(const SettingsScreen()),
          ),
        ],
      ),
    );
  }
}
