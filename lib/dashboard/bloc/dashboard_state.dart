part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DataLoaded extends DashboardState {
  final DataApi data;

  const DataLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class DataError extends DashboardState {
  final String? message;
  const DataError(this.message);
}

class DataMessage extends DashboardState {
  final String? message;
  const DataMessage(this.message);
}
