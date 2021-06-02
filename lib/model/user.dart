import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:provider/provider.dart';

class User extends ChangeNotifier{
  final String id, firstName, lastName, profilePicture, mobilPhone, email;
  bool isLogin;

  User({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.profilePicture,
    @required this.mobilPhone,
    @required this.email,
  });

  static Future<User> fromJson(LinkedInUserModel user) async {
    print(user.profilePicture.displayImageContent.elements.first.identifiers.first.identifier);
    return User(id: user.userId, firstName: user.firstName.localized.label, lastName: user.lastName.localized.label, profilePicture: user.profilePicture.displayImageContent.elements.first.identifiers.first.identifier, mobilPhone: "", email: user.email.elements.first.handleDeep?.emailAddress);
    // return User(
    //   id = user.firstName.localized.label,
    //   firstName = user.,
    //   lastName = user.,
    //   profilePicture = user.,
    //   mobilPhone = user.,
    //   email = user.,
    // );
  }

  // static User fromJson(Map<String, dynamic> json) {
  //   print(json);
  //   return User(
  //       id: json['id'],
  //       firstName: json['firstName'],
  //       lastName: json['lastName'],
  //       profilePicture: json['profilePicture'],
  //       mobilPhone: json['mobilephone'],
  //       email: json['email'],
  //   );
  // }

  Map<String,dynamic> toJson() {
    return {
      'id': this.id,
      'firstname': this.firstName,
      'lastname': this.lastName,
      'mobilephone': this.mobilPhone,
      'profilePicture': this.profilePicture,
      'email': this.email,
    };
  }

  void loginUser(){
    this.isLogin = true;
    notifyListeners();
  }

  void logoutUser(){
    this.isLogin = false;
    notifyListeners();
  }

}
