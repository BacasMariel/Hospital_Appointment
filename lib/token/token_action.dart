import 'package:shared_preferences/shared_preferences.dart';

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
  final String? id = prefs.getString('id');
  return id;
}
