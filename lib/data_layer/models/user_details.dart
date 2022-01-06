import 'dart:convert';


UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.isVerify,
  });
  String uid;
  String name;
  String email;
  String phoneNumber;
  bool isVerify;
  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    name: json["name"],
    email: json["email"],
    phoneNumber: json["PhoneNumber"],
    uid:json['uid'],
    isVerify: json['isVerify'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "PhoneNumber": phoneNumber,
  };
}
