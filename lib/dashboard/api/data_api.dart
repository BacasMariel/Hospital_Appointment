import 'dart:async';

import 'package:hospital_app/dashboard/model/model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DataRepository {
  DataApi? _data;

  Future<DataApi?> getData(String token) async {
    if (_data != null) return _data;

    try {
      _setHeaders() => {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          };

      final response = await http.get(
          Uri.parse('http://192.168.254.102:8000/api/datas'),
          headers: _setHeaders());

      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body);
        DataApi api = DataApi.fromJson(jsonResponse[0]);
        return api;
        // return Album.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 422) {
        throw Exception('Code : 422 - Unable to process request');
      } else if (response.statusCode == 500) {
        throw Exception('Code : 500 - Internal Server Error');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return null;
    }
  }
}
