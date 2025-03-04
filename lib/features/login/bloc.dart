import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_login_regsister/core/logic/dio_helper.dart';

part 'states.dart';
part 'events.dart';
part 'model.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc():super(LoginStates()){
    on<PostLoginDataEvent>(_postLogin);
  }
  

  Future<void> _postLogin(PostLoginDataEvent event, Emitter<LoginStates> emit) async {
    emit(LoginLoadingState());
    
    final response=await DioHelper.send("login",data: {
      "phone":event.phone,
      "password":event.password,
      "type":"android",
      "device_token":"test",
      "user_type":"client"
    });

    if(response.isSucess){
      final model=LoginData.fromJson(response.data);
      emit(LoginSuccessState(loginData: model));
    }else{
          print("Error:- ${response.msg}");
          emit(LoginFailedState(msg: response.msg));
          }
  }
}