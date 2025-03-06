import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_regsister/core/logic/cash_helper.dart';
import 'package:flutter_login_regsister/core/logic/get_it.dart';
import 'package:flutter_login_regsister/core/logic/kiwi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/logic/helper_methods.dart';
import 'firebase_options.dart';
import 'views/login/view.dart';
import 'views/splash/view.dart';

Future<void> main() async {

  await WidgetsFlutterBinding.ensureInitialized();

  CashHelper.init();

  initGetIt();

  initKiwi();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar'),Locale('fr')],
        path: 'assets/translations', // <-- change the path of the translation files 
        fallbackLocale: Locale('en'),
        startLocale: Locale('ar'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    // Use builder only if you need to use library outside ScreenUtilInit context
    builder: (_ , child) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //locale: context.deviceLocale,
      title: 'Login-Regsister app',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigtorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue,primary: Colors.blue),
        fontFamily: "Roboto",
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow,
          titleTextStyle: TextStyle(color: Colors.blue,fontSize: 24.r,fontWeight: FontWeight.bold,fontFamily: "Kanit"),
          centerTitle: true
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.withOpacity(.5),
            textStyle: TextStyle(color: Colors.orange,fontSize: 22,fontWeight: FontWeight.w600)
          )
        ),

        iconTheme: IconThemeData(
          color: Colors.blue
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(color: Colors.orange,width: 2.r)
            ),
            textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Color(0xffffffff))
          )
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(color: Colors.blue,width: 2.r,style: BorderStyle.solid)
            )
          )
        )
      ),
      home: const SplashView(),
    );
    },
    );
  }
}


