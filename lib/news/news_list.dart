import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/widgets/errror_indicator.dart';
import 'package:news_app/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  final String sourceId;
  final String searchQuery;

  const NewsList({
    super.key,
    required this.sourceId,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: APIService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return const ErrrorIndicator();
        }

        final newsList = snapshot.data?.articles ?? [];

        final filtered = newsList.where((article) {
          final title = article.title?.toLowerCase() ?? '';
          return title.contains(searchQuery.toLowerCase());
        }).toList();

        if (filtered.isEmpty) {
          return const Center(
            child: Text(
              "No results found.",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            return NewsItem(filtered[index]);
          },
        );
      },
    );
  }
}
