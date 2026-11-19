import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constant/api_endpoint.dart';
import 'package:flutter_application_1/core/network/api_client.dart';
import 'package:flutter_application_1/features/home/data/news_data.dart';
import 'package:flutter_application_1/features/home/model/news_response/news_response.dart';

class NewsDataImp implements NewsData {
  final Dio _apiClient = ApiClient.dio;
  Future<NewsResponse> getNews({required String catigory}) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoint.path,
        queryParameters: {"category": catigory, "apiKey": ApiEndpoint.apiKe},
      );
      if(response.statusCode==200){
        return NewsResponse.fromJson(response.data);
      }
    } catch (error) {
       log("error in responce${error.toString()}");
    }
    throw Exception();
  }
}
