import 'package:test_app_search/api/search_client.dart';
import 'package:test_app_search/models/search_result.dart';

class SearchRepository {
  final SearchClient client;

  SearchRepository(this.client);

  Future<SearchResult> search(String query) async {
    final result = await client.search(query);
    return result;
  }
}
