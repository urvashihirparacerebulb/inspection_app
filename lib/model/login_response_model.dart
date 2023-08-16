// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponseModel welcomeFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String welcomeToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  User? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: User.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class User {
  User({
    this.groupId,
    this.erpId,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.dialCode,
    this.countryCode,
    this.contactNo,
    this.designation,
    this.profileComplete,
    this.status,
  });

  int? groupId;
  String? erpId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? dialCode;
  String? countryCode;
  String? contactNo;
  String? designation;
  int? profileComplete;
  int? status;

  factory User.fromJson(Map<String, dynamic> json) => User(
    groupId: json["group_id"],
    erpId: json["erp_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    emailAddress: json["email_address"],
    dialCode: json["dial_code"],
    countryCode: json["country_code"],
    contactNo: json["contact_no"],
    designation: json["designation"],
    profileComplete: json["profile_complete"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "group_id": groupId,
    "erp_id": erpId,
    "first_name": firstName,
    "last_name": lastName,
    "email_address": emailAddress,
    "dial_code": dialCode,
    "country_code": countryCode,
    "contact_no": contactNo,
    "designation": designation,
    "profile_complete": profileComplete,
    "status": status,
  };
}
