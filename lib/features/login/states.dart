part of 'bloc.dart';

class LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginFailedState extends LoginStates{
  final String msg;

  LoginFailedState({required this.msg});
}

class LoginSuccessState extends LoginStates{
  final LoginData loginData;

  LoginSuccessState({required this.loginData});
}