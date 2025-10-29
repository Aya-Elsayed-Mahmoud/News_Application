import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_screen.dart';
import 'package:news_app/categories/category_details_screen.dart';
import 'package:news_app/categories/category_model.dart';

import 'drawer/home_drawer.dart';
import 'l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget selectedScreen = const SizedBox();
  CategoryModel? selectedCategory;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedScreen = CategoriesScreen(onCategorySelected: onCategorySelected);
  }

  void onDrawerItemSelected(Widget newScreen) {
    setState(() {
      selectedScreen = newScreen;
      selectedCategory = null;
      isSearching = false;
      searchController.clear();
    });
    Navigator.pop(context);
  }

  void onCategorySelected(CategoryModel category) {
    setState(() {
      selectedCategory = category;
      selectedScreen = CategoryDetailsScreen(
        categoryId: category.id,
        searchQuery: searchController.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
          controller: searchController,
          autofocus: true,
          onChanged: (value) {
            setState(() {
              if (selectedCategory != null) {
                selectedScreen = CategoryDetailsScreen(
                  categoryId: selectedCategory!.id,
                  searchQuery: value,
                );
              }
            });
          },
          decoration: InputDecoration(
            hintText: t.searchHint,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
        )
            : Text(
          selectedCategory?.title ?? t.appTitle,
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: AppTheme.white),
        ),
        actions: selectedCategory != null
            ? [
          IconButton(
            icon: Icon(
              isSearching ? Icons.close : Icons.search,
              color: AppTheme.white,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                  selectedScreen = CategoryDetailsScreen(
                    categoryId: selectedCategory!.id,
                    searchQuery: "",
                  );
                }
              });
            },
          ),
        ]
            : [],
      ),
      drawer: HomeDrawer(
        onItemSelected: onDrawerItemSelected,
        onCategorySelected: onCategorySelected,
      ),
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
