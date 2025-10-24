import 'package:flutter/material.dart';
import 'package:news_app/categories/category_model.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/tabs/tab_item.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final CategoryModel category;

  const CategoryDetailsScreen({super.key, required this.category});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  int selectedTabIndex = 0;
  final sources = List.generate(10, (index) => "source$index");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              onTap: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              tabs: sources.map(

                      (source) =>
                      TabItem(
                          isSelected: sources.indexOf(source) ==
                              selectedTabIndex,
                          source: source
                      )
              ).toList()
          ),
        ),
        Expanded(child:
        ListView.builder(
          itemBuilder: (_, index) =>
          const NewsItem(),
          itemCount: 10,))
      ],
    );
  }
}