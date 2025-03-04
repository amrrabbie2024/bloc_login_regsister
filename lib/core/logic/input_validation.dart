class InputValidation{

  static String? phone(String? value){
    if(value!.isEmpty)
      return "Must enter your phone number";
    else if(value.length < 11)
      return "Invalid number";
    else
      return null;
  }

  static String? password(String? value){
    if(value!.isEmpty)
      return " Must enter password";
    else if(value.length < 9)
      return "Password must be at least 9 characters";
    else
      return null;
  }

  static String? rePassword(String? value){
    if(value!.isEmpty)
      return " Must enter password again";
    else if(value.length < 9)
      return "Password must be at least 9 characters";
    else
      return null;
  }

  static String? fName(String? value){
    if(value!.isEmpty)
      return "Must enter full name";
    else if(!value.contains(" "))
      return "Must enter second name";
    else
      return null;
  }
}