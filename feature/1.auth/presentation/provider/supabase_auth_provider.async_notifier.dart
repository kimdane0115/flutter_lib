// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'supabase_auth_provider.async_notifier.g.dart';

final authStreamProvider = StreamProvider<AuthState>((ref) {
  return Supabase.instance.client.auth.onAuthStateChange;
});

@Riverpod(keepAlive: true)
class SupaBaseAuthAsyncNotifier extends _$SupaBaseAuthAsyncNotifier {
  @override
  FutureOr<void> build() async {
    // return '';
  }

  FutureOr<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        // clientId: '881065404338-qf1nkl9fuu0mjh4va08j94n150dhhuqi.apps.googleusercontent.com',
        // serverClientId: '881065404338-bed4vqep68oqsvdil74djqc120ohgsf2.apps.googleusercontent.com',
      ).signIn();
      // String iosClientId = '';
      // String webClientId = '';
      // final GoogleSignInAccount? googleUser = await GoogleSignIn(
      //   clientId: iosClientId,
      //   serverClientId: webClientId,
      // ).signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      print('>>>> displayName : ${googleUser?.displayName}');
      print('>>>> email : ${googleUser?.email}');
      print('>>>> accessToken : ${googleAuth?.accessToken}');
      print('>>>> idToken : ${googleAuth?.idToken}');

      //  OAuthCredential _googleCredential = GoogleAuthProvider.credential(
      //   idToken: googleAuth?.idToken,
      //   accessToken: googleAuth?.accessToken,
      // );

      // UserCredential _credential =
      //     await FirebaseAuth.instance.signInWithCredential(_googleCredential);
      // if (_credential.user != null) 
      //   print(">>>> ${_credential.user}");
      //   return _credential.user!.displayName ?? ""; 
      // } else {
      //   return '';
      // }

      /// supabase auth
      final AuthResponse response = await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth?.idToken ?? '',
        accessToken: googleAuth?.accessToken,
      );
      // return '';
    });
  }

  FutureOr<void> signInWithKakao() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // if (ref.read(meAsyncNotifierProvider).value!.data!.socialType == SocialType.google) {
      //   await GoogleSignIn().signOut();
      // }
      // FirebaseService().unsubscribe();
      await GoogleSignIn().signOut();
      await Supabase.instance.client.auth.signOut();
    });
  }
}