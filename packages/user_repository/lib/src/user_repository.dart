import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  User? _user;

  Future<Database?> connection() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'hospital_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, type TEXT, password TEXT, status TEXT)',
        );
      },
      version: 1,
    );

    return database;
  }

  Future<Map<String, Object?>?> getLocalUser(int id) async {
    final db = await connection();

    if (db != null) {
      final res = await db.rawQuery("SELECT * FROM users WHERE id = '$id' ");

      if (res.length > 0) {
        return res.first;
      } else {
        return null;
      }
    } else {
      print('db is null');
      return null;
    }
  }

  Future<User?> getUser(String token, String id) async {
    if (_user != null) return _user;

    try {
      _setHeaders() => {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          };

      final response = await http.get(
          Uri.parse('http://192.168.254.102:8000/api/user'),
          headers: _setHeaders());

      print(response.statusCode);
      print('here status user');
      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body);

        // return jsonDecode(response.body);
        // return jsonResponse.map((e) => User.fromJson(e));
        return User.fromJson(jsonResponse);
        // return Album.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 422) {
        throw Exception('Code : 422 - Unable to process request');
      } else if (response.statusCode == 500) {
        throw Exception('Code : 500 - Internal Server Error');
      } else {
        print(response.statusCode);
        throw Exception('Failed to load album');
      }
    } on SocketException {
      dynamic users = await getLocalUser(int.parse(id));
      if (users == null) {
        return null;
      } else {
        return User.fromJson(users);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
