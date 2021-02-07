import 'package:test_app_search/models/user.dart';
import 'package:intl/intl.dart';

class SearchResultItem {
  final String fullName;
  final int stargazersCount;
  final User owner;
  final String updatedAt;

  const SearchResultItem(
      {this.fullName, this.stargazersCount, this.owner, this.updatedAt});

  static SearchResultItem fromJson(dynamic json) {
    return SearchResultItem(
      fullName: json['full_name'] as String,
      stargazersCount: json['stargazers_count'] as int,
      owner: User.fromJson(json['owner']),
      updatedAt: json['updated_at'] as String,
    );
  }

  String get date {
    if (updatedAt != null) {
      return updatedAt.getDate();
    }
    return '';
  }
}

extension EmailValidator on String {
  String getDate() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat("dd MMMM");
    return dateFormat.format(dateTime);
  }
}
