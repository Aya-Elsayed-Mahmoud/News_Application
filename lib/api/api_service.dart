import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/sources_response.dart';

class APIService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(APIConstant.baseURL, APIConstant.sourcesEndPoint, {
      "apiKey": APIConstant.apiKey,
      "category": categoryId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(APIConstant.baseURL, APIConstant.newsEndPoint, {
      "apiKey": APIConstant.apiKey,
      "sources": sourceId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
