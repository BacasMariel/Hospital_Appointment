part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends DashboardEvent {}

class UpdateData extends DashboardEvent {
  final DataApi data;
  const UpdateData(this.data);

  @override
  List<Object> get props => [data];
}
