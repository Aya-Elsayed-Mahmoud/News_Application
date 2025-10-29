import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article news;

  const NewsDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title ?? "News Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                news.urlToImage ?? "",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Image.asset("assets/images/no-image.png"),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              news.title ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(news.description ?? "No description available."),
          ],
        ),
      ),
    );
  }
}
