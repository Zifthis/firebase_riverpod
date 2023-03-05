import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_riverpod/core/domain/notifier/firebasae_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider((ref) => AuthRepository(ref));

class AuthRepository {
  final Ref ref;
  const AuthRepository(this.ref);

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await ref
          .read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException {
      // Handle exceptions here
      return null;
    }
  }
}
