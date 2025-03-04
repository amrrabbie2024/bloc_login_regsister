import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_regsister/core/design/app_Loading.dart';
import 'package:flutter_login_regsister/core/design/app_failed.dart';
import 'package:flutter_login_regsister/core/design/app_input.dart';
import 'package:flutter_login_regsister/core/logic/helper_methods.dart';
import 'package:flutter_login_regsister/features/regsister/bloc.dart';
import 'package:flutter_login_regsister/views/login/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';

import '../../core/logic/input_validation.dart';

class RegsisterView extends StatefulWidget {
  const RegsisterView({super.key});

  @override
  State<RegsisterView> createState() => _RegsisterViewState();
}

final fnameController=TextEditingController(text: "");
final phoneController=TextEditingController(text: "");
final passwordController=TextEditingController(text: "");
final rePasswordController=TextEditingController(text: "");
final kForm=GlobalKey<FormState>();
bool isPassword=true;
bool isRePassword=true;

final kkbloc=KiwiContainer().resolve<RegsisterBloc>();
final ggbloc=GetIt.I<RegsisterBloc>();

class _RegsisterViewState extends State<RegsisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regsister"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(start: 12.w,end: 12.w),
        child: Form(
          key: kForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32.h,),
              Center(child: SvgPicture.asset("assets/svg/signup.svg",width: 90.w,height: 60.h,fit: BoxFit.fill,)),
              SizedBox(height: 24.h,),
              _fullNameInput(),
              SizedBox(height: 12.h,),
              _mobileInput(),
              SizedBox(height: 12.h,),
              _passwordInput(),
              SizedBox(height: 12.h,),
              _rePasswordInput(),
              SizedBox(height: 16.h,),
              BlocConsumer(
                bloc: ggbloc,
                listener: (context, state) {
                  if(state is RegsisterFailedState)
                    showMessage(state.msg);
                  else if(state is RegsisterSuccessState){
                    showMessage("${state.signupData.message}",isSucess: true);
                    navigateTo(LoginView());
                  }
                },
                builder: (context, state) {
                  if(state is RegsisterFailedState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _signUpButton(),
                        SizedBox(height: 8.h,),
                        AppFailed(msg: state.msg),
                      ],
                    );
                  else if(state is RegsisterLoadingState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _signUpButton(),
                        SizedBox(height: 8.h,),
                        AppLoading(),
                      ],
                    );
                  else if(state is RegsisterSuccessState)
                    return _signUpButton();
                  else
                    return _signUpButton();
                },
              ),
              SizedBox(height: 12.h,),
              _signInInput(),
            ],
          ),
        ),
      ),
    );
  }

  _fullNameInput() {
    return AppInput(
      prefix: Icon(Icons.person,color: Theme.of(context).primaryColor,),
      hintText: "Must enter full name",
      labelText: "Full name",
      keyboardType: TextInputType.text,
      controller: fnameController,
      validator: InputValidation.fName,
    );
  }

  _mobileInput() {
    return AppInput(
      prefix: Icon(Icons.phone,color: Theme.of(context).primaryColor,),
      hintText: "Must enter mobile number",
      labelText: "Mobile number",
      keyboardType: TextInputType.phone,
      controller: phoneController,
      validator: InputValidation.phone,
    );
  }

  _passwordInput() {
    return AppInput(
      prefix: Icon(Icons.password,color: Theme.of(context).primaryColor,),
      suffix: IconButton(
        icon: Icon(isPassword?Icons.visibility:Icons.visibility_off,color: Theme.of(context).primaryColor,),
        onPressed: () {
          setState(() {
            isPassword=!isPassword;
          });
        },
      ),
      obscureText: isPassword,
      hintText: "Must enter password",
      labelText: "Password",
      keyboardType: TextInputType.text,
      controller: passwordController,
      validator: InputValidation.password,
    );
  }

  _rePasswordInput() {
    return AppInput(
      prefix: Icon(Icons.password,color: Theme.of(context).primaryColor,),
      suffix: IconButton(
        icon: Icon(isRePassword?Icons.visibility:Icons.visibility_off,color: Theme.of(context).primaryColor,),
        onPressed: () {
          setState(() {
            isRePassword=!isRePassword;
          });
        },
      ),
      obscureText: isRePassword,
      hintText: "Must enter password again",
      labelText: "Password again",
      keyboardType: TextInputType.text,
      controller: rePasswordController,
      validator: InputValidation.rePassword,
    );
  }

  _signUpButton() {
    return SizedBox(
      height: 48.h,
      child: FilledButton.icon(onPressed: () {
        if(kForm.currentState!.validate()){
          ggbloc.add(PostRegsisterDataEvent(fullname: fnameController.text, password: passwordController.text, password_confirmation: rePasswordController.text, phone: phoneController.text));
         // kkbloc.add(PostRegsisterDataEvent(fullname: fnameController.text, password: passwordController.text, password_confirmation: rePasswordController.text, phone: phoneController.text));
        }
      }, icon: Icon(Icons.how_to_reg), label: Text("Sign up")),
    );
  }

  _signInInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Have an account?",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500 ),),
        SizedBox(width: 1.w,),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.transparent
            ),
            onPressed: () {
              navigateTo(LoginView());
            }, child: Text("Sign in",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24,fontWeight: FontWeight.bold),))
      ],
    );
  }

}
