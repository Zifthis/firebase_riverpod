import 'package:firebase_riverpod/core/data/repository/auth_repo.dart';
import 'package:firebase_riverpod/core/data/repository/i_auth_repo.dart';
import 'package:firebase_riverpod/core/domain/notifier/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.read(authRepoProvider),
  ),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepos _authRepo;
  AuthNotifier(this._authRepo) : super(const AuthState.initial());

  Future<void> signIn({required String email, required String pass}) async {
    final signInResult = await _authRepo.signIn(email, pass);
    AuthState.login(signInResult);

    /*await signInResult.fold(
      (failure) async => state = AuthState.failure(failure),
      (success) async {
        if (!success.registrationComplete) {
          await _setNewUser(success.user);
        }
        state = const AuthState.authenticated();
      },
    );*/
  }

  Future<void> signOut() async {
    final data = await _authRepo.signOut();
    return data;
    /*state = result.fold(
      (failure) => AuthState.failure(failure),
      (success) => const AuthState.signedOut(),
    );*/
  }
}
