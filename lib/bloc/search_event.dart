import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class OnSearch extends SearchEvent {
  final String text;

  const OnSearch({this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'OnSearchTap { text: $text }';
}
