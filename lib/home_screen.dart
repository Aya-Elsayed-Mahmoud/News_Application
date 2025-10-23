import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_screen.dart';
import 'package:news_app/settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final Widget body;

  const HomeScreen({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppTheme.primary,
              ),
              child: Text(
                "News App!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppTheme.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.menu_outlined),
              title: Text(
                "Categories",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, CategoriesScreen.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, SettingsScreen.routeName);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                  image: AssetImage( "assets/images/background.png"),
              )
            ),
          ),
          body
        ],
      ),
    );
  }
}
