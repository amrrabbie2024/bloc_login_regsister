part of '../view.dart';
class MAlertDialog extends StatelessWidget {
  const MAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select action"),
      titleTextStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22),
      icon: Icon(Icons.call_to_action_outlined),
      backgroundColor: Colors.yellow.withOpacity(.3),
      shadowColor: Colors.green,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(color: Theme.of(context).primaryColor)
      ),
      actions: [
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
    );
  }
}
