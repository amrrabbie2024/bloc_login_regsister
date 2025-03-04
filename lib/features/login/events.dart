part of 'bloc.dart';

class LoginEvents{}

class PostLoginDataEvent extends LoginEvents{
  final String phone,password;

  PostLoginDataEvent({required this.phone,required this.password});
}