import 'package:flutter/material.dart';
import 'package:news_app/tabs/tab_item.dart';

import '../models/sources_response.dart';
import '../news/news_list.dart';

class SourcesTabs extends StatefulWidget {
  final List<Source> source;
  final String searchQuery;

  const SourcesTabs(this.source, {
    super.key,
    required this.searchQuery,
  });

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.source.length,
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
            tabs: widget.source
                .map(
                  (source) => TabItem(
                    isSelected:
                    widget.source.indexOf(source) == selectedTabIndex,
                    source: source.name ?? "",
                  ),
            )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(
            sourceId: widget.source[selectedTabIndex].id ?? "",
            searchQuery: widget.searchQuery,

          ),
        ),
      ],
    );
  }
}
