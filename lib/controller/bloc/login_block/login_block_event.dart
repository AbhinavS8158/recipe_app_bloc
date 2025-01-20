part of 'login_block_bloc.dart';

@immutable
abstract class LoginBlockEvent {}

class LogginSubmitted extends LoginBlockEvent {
  final String username;
  final String password;

  LogginSubmitted({required this.username, required this.password});
}
