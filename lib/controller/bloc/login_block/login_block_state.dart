part of 'login_block_bloc.dart';

@immutable
abstract class LoginBlockState {}

class LoginBlockInitial extends LoginBlockState {}

class LoginBlockloading extends LoginBlockState {
}

class LoginSuccess extends LoginBlockState {}

class Loginfailed extends LoginBlockState {
  final String error;
  Loginfailed({required this.error});
}
