import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/gender.dart';

class Network{
  static String url = 'https://api.genderize.io/?name=';
  //static String tUrl = 'genderize.io/';
  static Future<dynamic> getGender(String name) async {
    // var headers = {
    //   "name": name
    // };
    var uri = Uri.parse(url+name);
    // var uri = Uri.https('api',tUrl,headers);
    // if (kDebugMode) {
    //   print(uri.toString());
    // }
    var res = await http.get(uri);
    if(kDebugMode){
      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');
    }
    var jsonRes = jsonDecode(res.body);
    if(kDebugMode){
      print(jsonRes);
    }
    if(res.statusCode == 200){
      return Gender.fromJson(jsonRes);
    }
    return null;
  }
}