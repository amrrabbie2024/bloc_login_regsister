import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_regsister/core/design/app_Loading.dart';
import 'package:flutter_login_regsister/core/design/app_failed.dart';
import 'package:flutter_login_regsister/core/design/app_input.dart';
import 'package:flutter_login_regsister/core/logic/cash_helper.dart';
import 'package:flutter_login_regsister/core/logic/helper_methods.dart';
import 'package:flutter_login_regsister/features/login/bloc.dart';
import 'package:flutter_login_regsister/views/regsister/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';

import '../../core/logic/input_validation.dart';
import '../home/view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final phoneController=TextEditingController(text: "966132847241864");
final passwordController=TextEditingController(text: "123456789");
final loginKeyForm=GlobalKey<FormState>();
bool isPassword=true;

final kbloc=KiwiContainer().resolve<LoginBloc>();
final gbloc=GetIt.I<LoginBloc>();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login".tr()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
        child: Form(
          key: loginKeyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 36.h,),
              Center(child: SvgPicture.asset("assets/svg/login.svg",width: 90.w,height: 60.h,fit: BoxFit.fill,)),
              SizedBox(height: 24.h,),
              _phoneInput(),
              SizedBox(height: 12.h,),
              _passwordInput(),
              SizedBox(height: 16.h,),
              BlocConsumer(
                bloc: kbloc,
                listener: (context, state) {
                  if(state is LoginFailedState)
                    showMessage(state.msg);
                  else if(state is LoginSuccessState){
                    showMessage("Success , Welocme back ${state.loginData.data.fullname}",isSucess: true);
                    CashHelper.saveLoginData(state.loginData);
                    navigateTo(HomePage());
                  }
                },
                builder: (context, state) {
                  if(state is LoginLoadingState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _loginButton(),
                        SizedBox(height: 8.h,),
                        AppLoading(),
                      ],
                    );
                  else if(state is LoginFailedState)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _loginButton(),
                        SizedBox(height: 8.h,),
                        AppFailed(msg: state.msg),
                      ],
                    );
                  else if(state is LoginSuccessState)
                    return _loginButton();
                  else
                    return _loginButton();
                },
              ),
              SizedBox(height: 12.h,),
              _signUpInput(),
              SizedBox(height: 12.h,),
              _facebookButton(),
              SizedBox(height: 8.h,),
              _emailButton(),
              SizedBox(height: 8.h,),
              _googleButton(),
            ],
          ),
        ),
      ),
    );
  }

   _googleButton() {
    return SizedBox(
      height: 48.h,
      child: OutlinedButton.icon(onPressed: () {

              }, icon: Icon(Icons.g_mobiledata), label: Text("Login in with google")),
    );
  }

   _emailButton() {
    return SizedBox(
      height: 48.h,
      child: OutlinedButton.icon(onPressed: () {

              }, icon: Icon(Icons.email), label: Text("Login in with email")),
    );
  }

   _facebookButton() {
    return SizedBox(
      height: 48.h,
      child: OutlinedButton.icon(onPressed: () {

              }, icon: Icon(Icons.facebook), label: Text("Login in with facebook")),
    );
  }

  AppInput _passwordInput() {
    return AppInput(
              prefix: Icon(Icons.password,color: Theme.of(context).primaryColor,),
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    isPassword=!isPassword;
                  });
                },
                icon: Icon(isPassword?Icons.visibility:Icons.visibility_off,color: Theme.of(context).primaryColor,),
              ),
              labelText: "Password",
              hintText: "Enter your password",
              keyboardType: TextInputType.text,
              obscureText: isPassword,
              controller: passwordController,
              validator: InputValidation.password,
            );
  }

  AppInput _phoneInput() {
    return AppInput(
              prefix: Icon(Icons.phone,color: Theme.of(context).primaryColor,),
              hintText: "Enter user phone number",
              labelText: "Phone number",
              keyboardType: TextInputType.phone,
              controller: phoneController,
              validator: InputValidation.phone,
            );
  }

  _loginButton() {
    return SizedBox(
      height: 48.h,
      child: FilledButton.icon(onPressed: () {
        if(loginKeyForm.currentState!.validate()){
          kbloc.add(PostLoginDataEvent(phone: phoneController.text, password: passwordController.text));
          //gbloc.add(PostLoginDataEvent(phone: phoneController.text, password: passwordController.text));
        }
      }, icon: Icon(Icons.login), label: Text("Login")),
    );
  }

  _signUpInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Do not have account?",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500 ),),
        SizedBox(width: 1.w,),
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent
            ),
            onPressed: () {
          navigateTo(RegsisterView());
        }, child: Text("Sign up",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24,fontWeight: FontWeight.bold),))
      ],
    );
  }
}
