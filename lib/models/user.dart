class User {
  final String login;
  final String avatarUrl;

  const User({this.login, this.avatarUrl});

  static User fromJson(dynamic json) {
    return User(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }
}
