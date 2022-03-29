import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth_token/token.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<String?> logIn({
    required String username,
    required String password,
  }) async {
    try {
      _setHeaders() => {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          };

      _setBody() => {
            'email': username,
            'password': password,
          };

      final response = await http.post(
          Uri.parse('http://10.0.2.2:8000/api/login'),
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
      } else {
        await Future.delayed(
          const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.unauthenticated),
        );
        return null;
      }
    } catch (e) {
      print(e.toString());
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
    } catch (e) {
      print(e);
    }
  }

  void dispose() => _controller.close();

  _storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
