part of '../view.dart';

class MBottomSheet extends StatelessWidget {
  const MBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.withOpacity(.3),
      height: 240.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8.h,),
          Text("Actions",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: 12.h,),
          Center(
            child: TextButton(onPressed: () {
              Navigator.pop(context);
              navigateTo(LoginView());
            }, child: Text("Login")),
          ),
          SizedBox(height: 8.h,),
          Center(
            child: TextButton(onPressed: () {
              Navigator.pop(context);
              navigateTo(RegsisterView());
            }, child: Text("Sign up")),
          ),
          SizedBox(height: 8.h,),
          Center(
            child: TextButton(onPressed: () {
              Navigator.pop(context);
              navigateTo(LocatizationView());
            }, child: Text("Change Language")),
          ),
          SizedBox(height: 8.h,),
        ],
      ),
    );
  }
}
