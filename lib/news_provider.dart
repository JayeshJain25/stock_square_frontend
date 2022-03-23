import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'news_model.dart';

class NewsProvider with ChangeNotifier {
  NewsProvider();

  List<NewsModel> newsCompleteList = [];

  NewsProvider.fromJson(List<dynamic> parsedJson) {
    List<NewsModel> list = [];
    list = parsedJson
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList();
    newsCompleteList = list;
  }

  Future<void> getNewsFeed() async {
    const url = "http://8f4a-49-36-111-77.in.ngrok.io/news/news";
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      final r = json.decode(response.body) as List<dynamic>;
      final NewsProvider model = NewsProvider.fromJson(r);
      for (final element in model.newsCompleteList) {
        newsCompleteList.add(element);
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
