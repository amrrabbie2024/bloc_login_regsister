import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_login_regsister/core/logic/dio_helper.dart';

part 'states.dart';
part 'events.dart';
part 'model.dart';

class RegsisterBloc extends Bloc<RegsisterEvents,RegsisterStates>{
  RegsisterBloc():super(RegsisterStates()){
    on<PostRegsisterDataEvent>(_postSignUp);
  }
  

  Future<void> _postSignUp(PostRegsisterDataEvent event, Emitter<RegsisterStates> emit) async {
    emit(RegsisterLoadingState());
    
    final response=await DioHelper.send("client_register",data: {
      "fullname":event.fullname,
      "password":event.password,
      "password_confirmation":event.password_confirmation,
      "phone":event.phone,
      "country_id":1,
      "city_1":7
    });

    if(response.isSucess){
      final model=SignupData.fromJson(response.data);
      emit(RegsisterSuccessState(signupData: model));
    }else{
      print("Error:- ${response.msg}");
      emit(RegsisterFailedState(msg: response.msg));
    }
  }
}