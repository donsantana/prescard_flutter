
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../app_config.dart';

class API{
  final storage = new FlutterSecureStorage();
  Future<void> getUserInfo() async{
    final authToken = await this.storage.read(key: "authToken");
    print(authToken);
    try{
      final response = await http.get(AppConfig.getUserProfileAPI, headers: {HttpHeaders.authorizationHeader: "Bearer $authToken","Content-Type": "application/json",
        "Accept": "application/json"});
      print(response);
      final parsed = json.decode(response.body);

      if (response.statusCode == 200){
        print(parsed);
        // final user = User.fromJson(parsed['data']);
        // getWells(user.ownerId);
        // return user;
      }else if(response.statusCode == 500){
        throw Exception('Failed to load User');
      }
    }on PlatformException catch(e){
      print("Error ${e.code} : ${e.message}");
    }
    return null;
  }
}