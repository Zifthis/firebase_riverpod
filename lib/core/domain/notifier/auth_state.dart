import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.logout() = _Logout;
  const factory AuthState.login(UserCredential userCredential) = _Login;
  const factory AuthState.error(String error) = _Failure;
}
