import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserRepository {
  Future<List<UserModel>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((userJson) => UserModel.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
