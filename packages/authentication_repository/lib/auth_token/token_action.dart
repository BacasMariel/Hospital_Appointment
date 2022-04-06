import 'package:shared_preferences/shared_preferences.dart';

// Token
fetchToken() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  return token;
}

storeToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

editToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', '');
}

// ID
fetchID() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('id');
  return token;
}

storeID(String id) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', id);
}

editID() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', '');
}
