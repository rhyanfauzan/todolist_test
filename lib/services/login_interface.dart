import 'package:app_checklist_testryan/api/api_url.dart';
import 'package:app_checklist_testryan/model/user_model.dart';
import 'package:dio/dio.dart';

abstract class ILogin {
  Future<UserModel?> login(String username, String password) async {
    final api = 'http://94.74.86.174:8080/api/login';
    final data = {"password": password, "username": username};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 201) {
      final body = response.data;
      return UserModel(username: username, token: body['data']);
    } else {
      return null;
    }
  }
}
