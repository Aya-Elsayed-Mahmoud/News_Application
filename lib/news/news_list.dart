import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../widgets/errror_indicator.dart';
import '../widgets/loading_indicator.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  final String sourceId;

  const NewsList(this.sourceId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return const ErrrorIndicator();
        } else {
          final newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(newsList[index]),
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
