import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  final signUpUrl = "https://monthly-grocery-schedule-backend.onrender.com/api/v1/mart-bag/users/signup";

  void postData() async{
    try{
      final response = await http.post(Uri.parse(signUpUrl),
      body: {
        "name": "",
        "phone": "",
        "address": "",
        "email": "",
        "password": "",
      });
      print(response.body);
    }catch (er){}
  }

  // postData(data, apiUrl) async{
  //   var fullUrl = baseurl + apiUrl;
  //   return await http.post(
  //     Uri.parse(fullUrl),
  //     body: {
  //       "name": "",
  //       "phone": "",
  //       "address": "",
  //       "email": "",
  //       "password": "",
  //     },
  //     headers: _setHeaders(),
  //   );
  // }
  //
  // _setHeaders() => {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  // };
  // var log = Logger();
  //
  // Future<dynamic> get(String url) async{
  //   url = formater(url);
  // //  Users/Signup
  //   var response = await http.get(url);
  //   log.i(response.body);
  //   log.i(response.statusCode);
  // }
  //
  // String formater (String url) {
  //   return baseurl + url;
  // }
}