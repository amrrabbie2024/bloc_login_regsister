import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText ;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  const AppInput({super.key, this.prefix, this.suffix, this.hintText, this.labelText, this.keyboardType,  this.obscureText=false, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefix: prefix,
        suffix: suffix,
        hintText: hintText,
        labelText: labelText,
        alignLabelWithHint: true,
        errorStyle: TextStyle(color: Colors.orange,fontSize: 24.r,fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Colors.green)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Colors.orange)
        ),
      ),
      maxLines: 1,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
    );
  }
}
