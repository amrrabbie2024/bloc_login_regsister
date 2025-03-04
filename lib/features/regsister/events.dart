part of 'bloc.dart';

class RegsisterEvents{}

class PostRegsisterDataEvent extends RegsisterEvents{
  final String fullname,password,password_confirmation,phone;

  PostRegsisterDataEvent(
      {required this.fullname,required this.password,required this.password_confirmation, required this.phone});
}