import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepos {
  Future<UserCredential> signIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> signOut();
}
