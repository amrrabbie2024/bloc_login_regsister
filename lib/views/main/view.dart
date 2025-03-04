import 'package:flutter/material.dart';
import 'package:flutter_login_regsister/core/logic/helper_methods.dart';
import 'package:flutter_login_regsister/views/locatization/view.dart';
import 'package:flutter_login_regsister/views/login/view.dart';
import 'package:flutter_login_regsister/views/regsister/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'compoents/alert_dialog.dart';
part 'compoents/bottom_sheet.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}



class _MainViewState extends State<MainView> {

  int currentTab=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) => MAlertDialog(),);
          }, icon: Icon(Icons.quick_contacts_dialer_outlined, color: Theme.of(context).primaryColor,size: 24.r,)),
          SizedBox(width: 2.w,),
          IconButton(onPressed: () {
            showModalBottomSheet(context: context, builder: (context) => MBottomSheet(),);
          }, icon: Icon(Icons.border_bottom_rounded, color: Theme.of(context).primaryColor,size: 24.r,)),
          SizedBox(width: 8.w,),
        ],
      ),
      drawer:  _myDrawyer(),
      bottomNavigationBar:  _myBottomNavigator(),
      floatingActionButton: _myFloatingButton(),
    );
  }

  Widget _myDrawyer() {
    return Drawer(
      width: 240.w,
      backgroundColor: Colors.yellow.withOpacity(.5),
      shadowColor: Colors.orange,
      elevation: 32,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25.r)),
        side: BorderSide(color: Colors.orange)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 48.h,),
          CircleAvatar(radius: 35.r,backgroundImage: AssetImage("assets/images/login.png"),),
          SizedBox(height: 8.h,),
          Text("Login-Regsister app",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24,fontWeight: FontWeight.w500),),
          SizedBox(height: 8.h,),
          TextButton(onPressed: () {
            navigateTo(LoginView());
          }, child: Text("Login")),
          SizedBox(height: 8.h,),
          TextButton(onPressed: () {
            navigateTo(RegsisterView());
          }, child: Text("Regsister")),
          SizedBox(height: 8.h,),
          TextButton(onPressed: () {
            navigateTo(LocatizationView());
          }, child: Text("Change Language")),
        ],
      ),
    );
  }

  Widget _myBottomNavigator() {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),topLeft: Radius.circular(20.r)),
      child: BottomNavigationBar(
        currentIndex: currentTab,
        backgroundColor: Colors.green.withOpacity(.5),
          iconSize: 32,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.yellow,
          selectedLabelStyle: TextStyle(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          onTap: (value) {
            setState(() {
              currentTab=value;
              if(currentTab==0)
                navigateTo(LoginView());
              else if(currentTab ==1)
                navigateTo(RegsisterView());
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.login),label: "Login",),
            BottomNavigationBarItem(icon: Icon(Icons.how_to_reg,),label: "Regsister")
          ]),
    );
  }

  _myFloatingButton() {
    return FloatingActionButton(
       backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
        side: BorderSide(color: Theme.of(context).primaryColor)
      ),
      child: Icon(Icons.local_activity_sharp,color: Colors.orange,),
      onPressed: () {
      navigateTo(LocatizationView());
    },);
  }
}
