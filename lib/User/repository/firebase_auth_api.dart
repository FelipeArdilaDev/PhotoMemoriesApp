import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final user =
        await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    ));

    // Once signed in, return the UserCredential
    return user;
  }

  signOut() async {
    await _auth.signOut().then((value) => print('Sesion cerrada'));
    googleSignIn.signOut();
    print('Sesiones cerradas');
  }
}
