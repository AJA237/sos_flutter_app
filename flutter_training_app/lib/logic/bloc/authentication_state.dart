part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {
  List<Object> get prop => [];
}

class Unauthenticated extends AuthenticationState {
  List<Object> get prop => [];
}
