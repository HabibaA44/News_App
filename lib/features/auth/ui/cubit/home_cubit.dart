import 'package:flutter_application_1/core/states/app_states.dart';
import 'package:flutter_application_1/features/auth/ui/cubit/home_state.dart';
import 'package:flutter_application_1/features/home/data/news_data_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  final NewsDataImp _newsDataImp = NewsDataImp();
  Future<void> getNews({required String catigory}) async {
    emit(state.copyWith(getNewsState: AppStates.loading));
    try {
      var response = await _newsDataImp.getNews(catigory: catigory);
      emit(
        state.copyWith(getNewsState: AppStates.success, newsResponse: response),
      );
    } catch (error) {
      emit(state.copyWith(getNewsState: AppStates.error));
    }
  }
}
