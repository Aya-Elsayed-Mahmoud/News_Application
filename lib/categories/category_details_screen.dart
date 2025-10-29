import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/tabs/sources_tabs.dart';
import 'package:news_app/widgets/errror_indicator.dart';
import 'package:news_app/widgets/loading_indicator.dart';

import '../l10n/app_localizations.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final String categoryId;
  final String? searchQuery;

  const CategoryDetailsScreen({
    super.key,
    required this.categoryId,
    this.searchQuery,
  });

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return FutureBuilder(
      future: APIService.getSources(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return const ErrrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTabs(
            sources,
            searchQuery: widget.searchQuery ?? "",
          );
        }
      },
    );
  }
}
