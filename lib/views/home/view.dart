import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_regsister/core/design/app_Loading.dart';
import 'package:flutter_login_regsister/core/design/app_failed.dart';
import 'package:flutter_login_regsister/core/logic/cash_helper.dart';
import 'package:flutter_login_regsister/core/logic/constants.dart';
import 'package:flutter_login_regsister/core/logic/helper_methods.dart';
import 'package:flutter_login_regsister/features/movies/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';
part 'compoents/list.dart';
part 'compoents/grid.dart';
part 'compoents/details.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var token=CashHelper.getToken();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w,vertical: 8.h),
        child: Column(
          children: [
            ListSection(),
            SizedBox(height: 8.h,),
            GridSection()
          ],
        ),
      ),
    );
  }
}
