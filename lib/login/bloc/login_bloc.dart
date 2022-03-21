import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        if (state.username.value == '' || state.password.value == '') {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        } else {
          dynamic result = await _authenticationRepository.logIn(
            username: state.username.value,
            password: state.password.value,
          );

          if (result == null) {
            emit(const LoginError('Username/Password is Invalid'));
          } else {
            // AuthenticationStatus.
            emit(state.copyWith(status: FormzStatus.submissionSuccess));
            emit(state.copyWith(password: const Password.pure()));
            emit(state.copyWith(username: const Username.pure()));
          }
        }
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        emit(const LoginError('Username/Password is Invalid'));
      }
    }
  }
}
