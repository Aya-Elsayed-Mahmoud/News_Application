import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_screen.dart';
import 'package:news_app/categories/category_details_screen.dart';
import 'package:news_app/categories/category_model.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget selectedScreen = const SizedBox();
  CategoryModel? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedScreen = CategoriesScreen(onCategorySelected: onCategorySelected);
  }

  void onDrawerItemSelected(Widget newScreen) {
    setState(() {
      selectedScreen = newScreen;
    });
    Navigator.pop(context);
  }

  void onCategorySelected(CategoryModel category) {
    setState(() {
      selectedCategory = category;
      selectedScreen = CategoryDetailsScreen(category: category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: AppTheme.white),
        ),
        elevation: 0,
      ),
      drawer: HomeDrawer(onItemSelected: onDrawerItemSelected,
        onCategorySelected: onCategorySelected,),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          selectedScreen,
        ],
      ),
    );
  }
}
