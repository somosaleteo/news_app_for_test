import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsApiService {
  static const String _apiKey = 'e314395b2db24dca8f827e2b44c73cf6';
  static const String _baseUrl = 'https://newsapi.org/v2';

  Future<List<NewsModel>> fetchTopHeadlines() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      final List articles = data['articles'];
      final news = articles.map((json) => NewsModel.fromJson(json)).toList();
      return news;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
