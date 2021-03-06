import 'package:equatable/equatable.dart';
import 'package:test_app_search/models/search_result_item.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends SearchState {
  const SearchStateEmpty();
}

class SearchStateLoading extends SearchState {
  const SearchStateLoading();
}

class SearchStateSuccess extends SearchState {
  final List<SearchResultItem> items;

  const SearchStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends SearchState {
  final String error;

  const SearchStateError(this.error);

  @override
  List<Object> get props => [error];
}
