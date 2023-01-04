import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mart_bag/controls/api_service_class.dart';
import 'package:mart_bag/models/signup_model.dart';

class DataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(SignUpBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    if (response.statusCode == 200) {
      isBack = true;

    }
    loading = false;
    notifyListeners();
  }
}