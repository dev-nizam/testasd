import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testasd/api/SearchApi.dart';
import 'package:testasd/model/SearchModel.dart';

part 'searcha_event.dart';
part 'searcha_state.dart';

class SearchaBloc extends Bloc<SearchaEvent, SearchaState> {
  late SearchModel searchDoctorModel;
  SearchApi searchApi = SearchApi();
  SearchaBloc() : super(SearchaInitial()) {
    on<FetchSearch>((event, emit) async {
      emit(SearchLoading());
      try {
        searchDoctorModel = await searchApi.getSearch();
        emit(SearchLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(SearchError());
      }
    });
  }
}
