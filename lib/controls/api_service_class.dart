import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mart_bag/models/signup_model.dart';


Future<http.Response?> register(SignUpBody data) async {
  http.Response? response;
  try {
    response =
    await http.post(
        Uri.parse("https://monthly-grocery-schedule-backend.onrender.com/api/v1/mart-bag/users/signup"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
  } catch (e) {
    log(e.toString());
    print(response?.body);
  }
  return response;
}