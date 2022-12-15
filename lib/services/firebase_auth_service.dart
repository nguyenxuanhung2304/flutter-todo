import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_todo/constants.dart' as constants;

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }

  void logout() {
    _firebaseAuth.signOut();
  }

  Future<void> createUserWithEmailAndPassword(email, password) async {
    if (email == null || password == null) return;

    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithEmailAndPassword(email, password) async {
    if (email == null || password == null) return;

    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  String getMessageFromErrorCode(errorCode) {
    switch (errorCode) {
      case constants.userNotFound:
        return "No user found with this email.";
      case constants.wrongPassword:
        return "Email or password is invalid. Please try again";
      case constants.invalidEmail:
        return "Email address is invalid";
      default:
        return "";
    }
  }
}
