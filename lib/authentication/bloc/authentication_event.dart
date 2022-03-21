part of 'authentication_bloc.dart';

abstract class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateStatusChanged extends AuthenticateEvent {
  const AuthenticateStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticateLogoutRequested extends AuthenticateEvent {}
