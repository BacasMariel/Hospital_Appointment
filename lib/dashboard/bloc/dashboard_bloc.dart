import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_app/dashboard/api/api.dart';
import 'package:hospital_app/dashboard/model/dashboard_data.dart';

import '../../token/token.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(DashboardInitial()) {
    on<LoadData>(_loadDataApi);
    on<UpdateData>((event, emit) async {
      if (state is DataLoaded) {
        emit(DashboardInitial());
        try {
          final data2 = _updateData(
            event.data.id,
            event.data.num_of_current_patient,
            event.data.num_of_discharge,
            event.data.num_of_admits,
            event.data.num_of_total_patient,
            event.data.cardiology_patient_count,
            event.data.telemetry_patient_count,
            event.data.oncology_patient_count,
            event.data.emergency_patient_count,
            event.data.orthopedic_patient_count,
            event.data.ob_patient_count,
            event.data.ob_er_patient_count,
            event.data.other_division_count,
            event.data.num_of_new_covid_cases,
            event.data.num_of_active_cases,
            event.data.num_of_covid_recovery,
            event.data.num_of_covid_deaths,
            event.data.num_of_total_covid_cases,
            event.data.percent_of_icu_bed_used,
            event.data.percent_of_isolation_bed_used,
            event.data.percent_of_wards_bed_used,
            event.data.total_icu_bed,
            event.data.total_isolation_bed,
            event.data.total_wards_bed,
            event.data.total_num_of_beds,
          );

          await Future<void>.delayed(const Duration(seconds: 1));
          emit(const DataMessage("Data Is Updated"));
          DataApi? data1 = await _tryGetData();
          if (data1 != null) {
            print('data is not null');
            print(data1.total_icu_bed);
            emit(DataLoaded(data: data1));
          } else {
            emit(const DataError('Data is null'));
          }
        } catch (e) {
          print(e.toString());

          emit(DataError(e.toString()));
        }
      }
    });
  }

  final DataRepository _dataRepository;

  void _loadDataApi(
    LoadData event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      final data1 = await _tryGetData();
      if (data1 != null) {
        emit(const DataMessage("Data Is Loaded"));
        emit(DataLoaded(data: data1));
      } else {
        emit(const DataError('Data is null'));
      }
    } catch (e) {
      // print(e.toString());
      emit(DataError(e.toString()));
    }
  }

  Future<DataApi?> _tryGetData() async {
    try {
      // String token = await fetchToken();
      String token = 'practice';
      final data1 = await _dataRepository.getData(token);
      return data1;
    } catch (e) {
      return null;
    }
  }

  Future<String> _updateData(
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
  ) async {
    String token = await fetchToken();
    final data1 = await _dataRepository.updateData(
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
        token.toString());
    return data1;
  }
}
