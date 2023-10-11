import '../model/user.dart';

class FailedLogin implements Exception {
  String errorMessage() {
    return 'Login failed';
  }
}

class LoginRepository {
  // data dummy
  String username = "User";
  String password = "123";

  Future<User> login(String username, String password) async {
    User userData = User();

    await Future.delayed(Duration(seconds: 2), () {
      //simulasi loading response server
      if (this.username == username && this.password == password) {
        userData = User(
            name: username, password: password, token: "123", npm: "210711407");
      } else if (username == '' || password == '') {
        throw "Username or password can't be empty";
      } else {
        throw FailedLogin();
      }
    });
    return userData;
  }
}
