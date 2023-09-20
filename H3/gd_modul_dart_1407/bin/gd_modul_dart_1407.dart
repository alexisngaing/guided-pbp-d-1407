import 'dart:io';

void main(List<String> arguments) {
  print('Welcome to GD Modul Dart!');
  print('=========================');
  print('----------Login----------');
  print('=========================');
  stdout.write('Username: ');
  String? username = stdin.readLineSync();
  stdout.write('Password: ');
  String? password = stdin.readLineSync();

  LoginController loginController = LoginController();
  loginController.login(username: username ?? '', password: password ?? '');
}

class LoginController {
  final LoginRepository loginRepository = LoginRepository();
  User userLogined = User();

  Future<void> login(
      {required String username, required String password}) async {
    try {
      userLogined = await loginRepository.login(username, password);
      print("\nLogin success...");
      print("Here your userdata: $userLogined");
    } on FailedLogin catch (e) {
      print(e.errorMessage());
    } on String catch (e) {
      print(e);
    } catch (e) {
      print(e.toString());
    } finally {
      print("\nLogin process has been completed");
    }
  }
}

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

class FailedLogin implements Exception {
  String errorMessage() {
    return '\nLogin failed [!]';
  }
}

class LoginRepository {
  String username = 'User';
  String password = '123';

  Future<User> login(String username, String password) async {
    print('\nGet your NPM...');
    print('Logining...');
    User userData = User();
    await Future.delayed(Duration(seconds: 3), () {
      if (this.username == username && this.password == password) {
        userData = User(
            name: username,
            password: password,
            token: '12345',
            npm: '210711407');
      } else if (username == '' || password == '') {
        throw ('\nUsername or password cannot be empty [!]');
      } else {
        throw FailedLogin();
      }
    });
    return userData;
  }
}
