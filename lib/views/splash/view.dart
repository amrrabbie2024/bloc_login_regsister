import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_regsister/core/logic/helper_methods.dart';
import 'package:flutter_login_regsister/views/login/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../locatization/view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
     // Navigator.push(context, MaterialPageRoute(builder: (context) => LocatizationView(),));
      navigateTo(LocatizationView(),withHistory: false);
    });
    return Scaffold(
      body: FadeInDownBig(
        duration: Duration(milliseconds: 1500),
        delay: Duration(milliseconds: 500),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(child: Image.asset("assets/images/login.png",width: 160.w,height: 180.h,fit: BoxFit.fill,)),
              SizedBox(height: 8.h,),
              Text("Login-Regsister app",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 26,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
