import 'package:flutter_application_1/features/home/model/news_response/news_response.dart';

abstract interface class NewsData {
  Future<NewsResponse>getNews({ required String catigory });
}