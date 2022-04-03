import 'package:equatable/equatable.dart';

class DataApi extends Equatable {
  const DataApi(
      this.id,
      this.num_of_current_patient,
      this.num_of_discharge,
      this.num_of_admits,
      this.num_of_total_patient,
      this.cardiology_patient_count,
      this.telemetry_patient_count,
      this.oncology_patient_count,
      this.emergency_patient_count,
      this.orthopedic_patient_count,
      this.ob_patient_count,
      this.ob_er_patient_count,
      this.other_division_count,
      this.num_of_new_covid_cases,
      this.num_of_active_cases,
      this.num_of_covid_recovery,
      this.num_of_covid_deaths,
      this.num_of_total_covid_cases,
      this.percent_of_icu_bed_used,
      this.percent_of_isolation_bed_used,
      this.percent_of_wards_bed_used,
      this.total_icu_bed,
      this.total_isolation_bed,
      this.total_wards_bed,
      this.total_num_of_beds);

  final int id;
  final int num_of_current_patient;
  final int num_of_discharge;
  final int num_of_admits;
  final int num_of_total_patient;
  final int cardiology_patient_count;
  final int telemetry_patient_count;
  final int oncology_patient_count;
  final int emergency_patient_count;
  final int orthopedic_patient_count;
  final int ob_patient_count;
  final int ob_er_patient_count;
  final int other_division_count;
  final int num_of_new_covid_cases;
  final int num_of_active_cases;
  final int num_of_covid_recovery;
  final int num_of_covid_deaths;
  final int num_of_total_covid_cases;
  final int percent_of_icu_bed_used;
  final int percent_of_isolation_bed_used;
  final int percent_of_wards_bed_used;
  final int total_icu_bed;
  final int total_isolation_bed;
  final int total_wards_bed;
  final int total_num_of_beds;

  @override
  List<Object> get props => [
        id,
        num_of_current_patient,
        num_of_discharge,
        num_of_admits,
        num_of_total_patient,
        cardiology_patient_count,
        other_division_count,
        telemetry_patient_count,
        oncology_patient_count,
        emergency_patient_count,
        orthopedic_patient_count,
        ob_patient_count,
        ob_er_patient_count,
        num_of_new_covid_cases,
        num_of_active_cases,
        num_of_covid_recovery,
        num_of_covid_deaths,
        num_of_total_covid_cases,
        percent_of_icu_bed_used,
        percent_of_isolation_bed_used,
        percent_of_wards_bed_used,
        total_icu_bed,
        total_isolation_bed,
        total_wards_bed,
        total_num_of_beds,
      ];

  static const empty = DataApi(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0);

  factory DataApi.fromJson(dynamic json) {
    return DataApi(
      json['id'],
      json['num_of_current_patient'],
      json['num_of_discharge'],
      json['num_of_admits'],
      json['num_of_total_patient'],
      json['cardiology_patient_count'],
      json['telemetry_patient_count'],
      json['oncology_patient_count'],
      json['emergency_patient_count'],
      json['orthopedic_patient_count'],
      json['ob_patient_count'],
      json['ob_er_patient_count'],
      json['other_division_count'],
      json['num_of_new_covid_cases'],
      json['num_of_active_cases'],
      json['num_of_covid_recovery'],
      json['num_of_covid_deaths'],
      json['num_of_total_covid_cases'],
      json['percent_of_icu_bed_used'],
      json['percent_of_isolation_bed_used'],
      json['percent_of_wards_bed_used'],
      json['total_icu_bed'],
      json['total_isolation_bed'],
      json['total_wards_bed'],
      json['total_num_of_beds'],
    );
  }
}
