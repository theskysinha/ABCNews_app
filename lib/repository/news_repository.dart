
import 'package:http/http.dart' as http;
import 'package:news_app/constants.dart';
import 'dart:convert';

import 'package:news_app/model/news_model.dart';

class NewsRepository {
  Future<List<NewsModel>> fetchNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?q=business&languages=en&apiKey=$apiKey';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List<NewsModel> articleModelList = [];
    if (response.statusCode == 200) {
      for (var data in jsonData['articles']) {
        if (data['urlToImage'] != null) {
          NewsModel articleModel = NewsModel.fromJson(data);
          articleModelList.add(articleModel);
        }
      }
      return articleModelList;
    } else {
      // returns an empty list.
      return articleModelList;
    }
  }

  Future<List<NewsModel>> fetchBreakingNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    List<NewsModel> articleModelList = [];
    if (response.statusCode == 200) {
      for (var data in jsonData['articles']) {
        if (data['description'].toString().isNotEmpty &&
            data['urlToImage'].toString().isNotEmpty) {
          NewsModel articleModel = NewsModel.fromJson(data);
          articleModelList.add(articleModel);
        }
      }
      return articleModelList;
    } else {
      // returns an empty list.
      return articleModelList;
    }
  }

  Future<List<NewsModel>> searchNews({required String query}) async {
    String url = '';
    if (query.isEmpty) {
      url =
          'https://newsapi.org/v2/everything?q=biden&from=2022-07-12&sortBy=popularity&apiKey=c3c8e3a211ed419c8da525aedac6625f';
    } else {
      url =
          "https://newsapi.org/v2/everything?q=$query&from=2022-07-12&sortBy=popularity&apiKey=$apiKey";
    }

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List<NewsModel> articleModelList = [];
    if (response.statusCode == 200) {
      for (var data in jsonData['articles']) {
        if (query.isNotEmpty && data['urlToImage'] != null) {
          NewsModel articleModel = NewsModel.fromJson(data);
          articleModelList.add(articleModel);
        } else if (query.isEmpty) {
          throw Exception('Query is empty');
        } else {
          throw Exception('Data was not loaded properly');
        }
      }
      return articleModelList;
    } else {
      // returns an empty list.
      return articleModelList;
    }
  }
}