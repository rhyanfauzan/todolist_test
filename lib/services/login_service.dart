// import 'package:dio/dio.dart';
import 'package:app_checklist_testryan/api/api_url.dart';
import 'package:app_checklist_testryan/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  @override
  // Get Token first
  Future<UserModel?> login(String username, String password) async {
    final api = Uri.parse('http://94.74.86.174:8080/api/login');
    final data = {"password": password, "username": username};
    Map<String, String> headers = {"Content-Type": "application/json"};

    http.Response response;
    response = await http.post(api, headers: headers, body: data);
    if (response.statusCode == 201) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      await storage.setString('TOKEN', body['token']);
      await storage.setString('USERNAME', username);
      print(response.statusCode);
      print('berhasil login');

      return UserModel(username: username, token: body['token']);
    } else {
      print(response.statusCode);
      print('gagal login');
      print(username);
      print(password);

      return null;
    }
  }
}
