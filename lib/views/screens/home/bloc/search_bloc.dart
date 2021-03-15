import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:test_app_search/api/search_repository.dart';
import 'package:test_app_search/models/search_result_error.dart';
import 'package:test_app_search/views/screens/home/bloc/search_event.dart';
import 'package:test_app_search/views/screens/home/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  SearchBloc({@required this.searchRepository}) : super(SearchStateEmpty());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is OnSearch) {
      final String query = event.text;
      if (query.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final results = await searchRepository.search(query);
          yield SearchStateSuccess(results.items);
        } catch (error) {
          yield error is SearchResultError
              ? SearchStateError(error.message)
              : SearchStateError('something went wrong');
        }
      }
    }
  }
}
