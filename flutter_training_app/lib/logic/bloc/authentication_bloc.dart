import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_training_app/data/model/firebase_model.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseRepository firebaseRepository;
  AuthenticationBloc({required this.firebaseRepository})
      : super(Unauthenticated()) {
    on<SignUpRequested>((event, emit) async {
      emit(AuthenticationInitial());
      try {
        await firebaseRepository.signUp(
            email: event.email, password: event.password);
      } catch (e) {
        emit(Unauthenticated());
      }
    });
  }
}
