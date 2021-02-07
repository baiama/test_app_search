import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app_search/models/search_result.dart';
import 'package:test_app_search/models/search_result_error.dart';

class SearchClient {
  final String baseUrl;
  final http.Client httpClient;

  SearchClient({
    http.Client httpClient,
    this.baseUrl = "https://api.github.com/search/repositories?q=",
  }) : this.httpClient = httpClient ?? http.Client();

  Future<SearchResult> search(String query) async {
    final response = await httpClient.get(Uri.parse("$baseUrl$query"));
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}
