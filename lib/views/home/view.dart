import 'package:flutter/material.dart';
import 'package:flutter_login_regsister/core/logic/cash_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var token=CashHelper.getToken();
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Home page ${token}",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24,fontWeight: FontWeight.bold),)),
    );
  }
}
