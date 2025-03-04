import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_regsister/core/logic/cash_helper.dart';
import 'package:flutter_login_regsister/core/logic/helper_methods.dart';
import 'package:flutter_login_regsister/views/login/view.dart';
import 'package:flutter_login_regsister/views/main/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocatizationView extends StatefulWidget {
  const LocatizationView({super.key});

  @override
  State<LocatizationView> createState() => _LocatizationViewState();
}

final languages=["English","العربية","French00"];
final langsCodes=["en","ar","fr"];
int currentLang=0;

class _LocatizationViewState extends State<LocatizationView> {
  @override
  void initState() {
    var savedLang=CashHelper.getLanguage();
    print(savedLang);
    if(savedLang=="en")
      currentLang=0;
    else if(savedLang == "ar")
      currentLang=1;
    else if(savedLang == "fr")
      currentLang=2;
    else
      currentLang=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("change_language".tr()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          ...List.generate(languages.length, (index) =>  _langItem(index))
        ],
      ),
    );
  }

  Widget _langItem(int index) {
    return Row(
      children: [
        Radio(
          activeColor: Colors.green,
          value: currentLang, groupValue: index, onChanged: (value) {
          setState(() {
            currentLang=index;
            context.setLocale(Locale(langsCodes[currentLang]));
            CashHelper.saveLanguage(langsCodes[currentLang]);
            navigateTo(MainView());
          });
        },),
        SizedBox(width: 6.w,),
        Text(languages[index],style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 21,fontWeight: FontWeight.w500),)
      ],
    );
  }
}
