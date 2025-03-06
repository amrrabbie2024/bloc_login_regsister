import 'package:flutter_login_regsister/features/login/bloc.dart';
import 'package:flutter_login_regsister/features/movies/bloc.dart';
import 'package:flutter_login_regsister/features/regsister/bloc.dart';
import 'package:get_it/get_it.dart';

void initGetIt(){
  final getit=GetIt.instance;

  getit.registerFactory(() => LoginBloc());
  getit.registerFactory(() => RegsisterBloc());
  getit.registerFactory(() => MoviesBloc());
}