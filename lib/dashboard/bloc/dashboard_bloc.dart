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
  }

  final DataRepository _dataRepository;

  void _loadDataApi(
    LoadData event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      final data = await _tryGetData();

      if (data != null) {
        emit(const DataMessage("Data Is Loaded"));
        emit(DataLoaded(data: data));
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
      String token = await fetchToken();
      final data = await _dataRepository.getData(token);

      return data;
    } catch (_) {
      return null;
    }
  }
}
