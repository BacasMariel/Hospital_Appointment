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

  Future<String> updateData(
      int id,
      int num_of_current_patient,
      int num_of_discharge,
      int num_of_admits,
      int num_of_total_patient,
      int cardiology_patient_count,
      int other_division_count,
      int telemetry_patient_count,
      int oncology_patient_count,
      int emergency_patient_count,
      int orthopedic_patient_count,
      int ob_patient_count,
      int ob_er_patient_count,
      int num_of_new_covid_cases,
      int num_of_active_cases,
      int num_of_covid_recovery,
      int num_of_covid_deaths,
      int num_of_total_covid_cases,
      int percent_of_icu_bed_used,
      int percent_of_isolation_bed_used,
      int percent_of_wards_bed_used,
      int total_icu_bed,
      int total_isolation_bed,
      int total_wards_bed,
      int total_num_of_beds,
      String token) async {
    try {
      _setHeaders() => {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          };
      Map<String, int> dashboardData = {
        'num_of_current_patient': num_of_current_patient,
        "num_of_discharge": num_of_discharge,
        "num_of_admits": num_of_admits,
        "num_of_total_patient": num_of_total_patient,
        "cardiology_patient_count": cardiology_patient_count,
        "telemetry_patient_count": telemetry_patient_count,
        "oncology_patient_count": oncology_patient_count,
        "emergency_patient_count": emergency_patient_count,
        "orthopedic_patient_count": orthopedic_patient_count,
        "ob_patient_count": ob_patient_count,
        "ob_er_patient_count": ob_er_patient_count,
        "other_division_count": other_division_count,
        "num_of_new_covid_cases": num_of_new_covid_cases,
        "num_of_active_cases": num_of_active_cases,
        "num_of_covid_recovery": num_of_covid_recovery,
        "num_of_covid_deaths": num_of_covid_deaths,
        "num_of_total_covid_cases": num_of_total_covid_cases,
        "percent_of_icu_bed_used": percent_of_icu_bed_used,
        "percent_of_isolation_bed_used": percent_of_isolation_bed_used,
        "percent_of_wards_bed_used": percent_of_wards_bed_used,
        "total_icu_bed": total_icu_bed,
        "total_isolation_bed": total_isolation_bed,
        "total_wards_bed": total_wards_bed,
        "total_num_of_beds":
            (total_icu_bed + total_isolation_bed + total_wards_bed),
      };

      final response = await http.put(
          Uri.parse('http://192.168.254.102:8000/api/datas/$id'),
          headers: _setHeaders(),
          body: jsonEncode(dashboardData));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 422) {
        print(response.body);
        throw Exception('Code : 422 - Unable to process request');
      } else if (response.statusCode == 500) {
        throw Exception('Code : 500 - Internal Server Error');
      } else {
        print(response.statusCode);
        throw Exception(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e).toString();
    }
  }
}
