import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{

  String ?name;
  String ?email;
  bool ?isVerify;
  String ?uid;
  String? number;
  String ?loginType;
  UserProvider({this.name, this.email, this.isVerify, this.uid,this.number,this.loginType,});
}