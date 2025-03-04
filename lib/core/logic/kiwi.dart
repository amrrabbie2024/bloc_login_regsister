import 'package:flutter_login_regsister/features/login/bloc.dart';
import 'package:flutter_login_regsister/features/regsister/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi(){
  final kiwi=KiwiContainer();

  kiwi.registerFactory((container) => LoginBloc());
  kiwi.registerFactory((container) => RegsisterBloc());
}