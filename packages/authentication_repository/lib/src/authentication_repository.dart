import 'dart:async';
import 'dart:io';
import 'package:authentication_repository/src/Models/model.dart';
import 'package:authentication_repository/src/localstorage/Database.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../auth_token/token.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

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

  Future<void> insertUsers(User users) async {
    final db = await connection();

    if (db != null) {
      await db.insert(
        'users',
        users.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      print('db is  null');
    }
  }

  Future<Map<String, Object?>?> logInUser(String email, String password) async {
    final db = await connection();

    if (db != null) {
      final res = await db.rawQuery(
          "SELECT * FROM users WHERE email = '$email' and password = '$password'");

      if (res.length > 0) {
        return res.first;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> logIn({
    required String username,
    required String password,
  }) async {
    await insertUsers(User(
        1, 'admin', 'admin@test.com', 'administration', 'pass123', 'active'));
    await insertUsers(
        User(2, 'user', 'user@test.com', 'user', 'pass123', 'active'));

    try {
      _setHeaders() => {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          };

      _setBody() => {
            'email': username,
            'password': password,
          };

      dynamic login = await logInUser('admin@test.com', 'pass123');

      final response = await http.post(
          Uri.parse('http://192.168.254.102:8000/api/login'),
          headers: _setHeaders(),
          body: jsonEncode(_setBody()));

      if (response.statusCode == 200) {
        dynamic bearerJson = json.decode(response.body);
        String bearerCode = bearerJson['access_token'];
        String bearer = "Bearer $bearerCode";
        _storeToken(bearer);

        await Future.delayed(
          const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.authenticated),
        );

        return 'here';
      } else if (response.statusCode == 404) {
        print('404 Error Code');
      } else {
        await Future.delayed(
          const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.unauthenticated),
        );
        return null;
      }
    } on SocketException {
      dynamic login = await logInUser(username, password);

      bool isLogin = (login != null);

      if (isLogin) {
        int idCode = login['id'];

        _storeID(idCode.toString());

        await Future.delayed(
          const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.authenticated),
        );

        return 'here';
      } else {
        await Future.delayed(
          const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.unauthenticated),
        );

        return null;
      }
    } catch (e) {
      await Future.delayed(
        const Duration(milliseconds: 300),
        () => _controller.add(AuthenticationStatus.unauthenticated),
      );
    }
    return null;
  }

  void logOut() async {
    try {
      String? token = await fetchToken();
      _setHeaders() => {
            'Accept': 'application/json',
            'Authorization': token.toString(),
          };

      final response = await http.get(
          Uri.parse('http://192.168.254.102:8000/api/logout'),
          headers: _setHeaders());

      _controller.add(AuthenticationStatus.unauthenticated);
    } on SocketException {
      await editID();
      _controller.add(AuthenticationStatus.unauthenticated);
    } catch (e) {
      print(e);
    }
  }

  void dispose() => _controller.close();

  _storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  _storeID(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', id);
  }
}
