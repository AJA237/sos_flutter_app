part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpRequested extends AuthenticationEvent {
  final String email;
  final String password;

  SignUpRequested({required this.email, required this.password});
}
