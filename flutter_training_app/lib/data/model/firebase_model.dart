import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  final firebase_auth = FirebaseAuth.instance;

  // registration method for signing up
  Future<void> signUp({required String email, required String password}) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exist');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
