import 'package:flutter_application_1/core/states/app_states.dart';
import 'package:flutter_application_1/features/home/model/news_response/news_response.dart';
import 'package:flutter_application_1/features/home/model/news_response/source.dart';

class HomeState {
  final AppStates getNewsState;
  final NewsResponse? newsResponse;
  final Source? source;

  HomeState({this.getNewsState = AppStates.initial, this.newsResponse ,this.source});

  HomeState copyWith({AppStates? getNewsState, NewsResponse? newsResponse,Source? source}) {
    return HomeState(
      getNewsState: getNewsState ?? this.getNewsState,
      newsResponse: newsResponse ?? this.newsResponse,
      source: source??this.source
    );
  }
}
