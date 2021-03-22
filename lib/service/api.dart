import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String url = 'http://192.168.0.108/points/public/api';

  Future<Map<String, dynamic>> login(String username, String password) async {
    var response = await http
        .post("$url/login", body: {'username': username, 'password': password});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      saveToken('token', data['access_token']);
      return data;
    }

    return null;
  }

  saveToken(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  getToken(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }
}
