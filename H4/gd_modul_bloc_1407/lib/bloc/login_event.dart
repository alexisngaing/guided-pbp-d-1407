abstract class LoginEvent {}

class IsPasswordVisibleChanged extends LoginEvent {}

class FormSubmitted extends LoginEvent {
  final String username;
  final String password;

  FormSubmitted({required this.username, required this.password});
}
