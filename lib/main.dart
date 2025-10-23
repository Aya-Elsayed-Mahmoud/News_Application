import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/settings/settings_screen.dart';

import 'categories/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SettingsScreen.routeName: (_) => SettingsScreen(),
        CategoriesScreen.routeName: (_) => CategoriesScreen(),

      },
      theme: AppTheme.lightTheme,
    );
  }
}
