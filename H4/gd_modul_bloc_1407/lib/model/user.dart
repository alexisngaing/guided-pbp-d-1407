class User {
  final String? name;
  final String? password;
  final String? token;
  final String? npm;

  User({this.name, this.password, this.token, this.npm});

  @override
  String toString() {
    return 'User{name: $name, password: $password, token: $token, npm: $npm}';
  }
}
