import 'dart:convert';

import 'package:kullanicilar/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService
{
  final String url = "https://reqres.in/api/users?page=2";
  Future<UsersModel?> fetchUsers() async
  {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200)
    {
      var jsonBody = UsersModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    }
    else
    {
      print("işlem başarısız oldu =>  ${res.statusCode} ");
    }
  }
}