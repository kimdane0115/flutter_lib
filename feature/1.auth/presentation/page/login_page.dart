

import 'dart:async';

import 'package:flutter_template/feature/1.auth/presentation/provider/supabase_auth_provider.async_notifier.dart';

import '../../../../core/constants/index.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              // googlelogin();
              _googleSignIn(context, ref);
            },
            child: const Text('Login Button'),
          ),
      ),
    );
  }

  Future<void> _googleSignIn(BuildContext context, WidgetRef ref) async {
    final loading = await showLoadingIndicator(context);
    ref.watch(supaBaseAuthAsyncNotifierProvider.notifier).signInWithGoogle();
    
    // try {
    //   if (await GoogleSignIn().isSignedIn()) {
    //     await GoogleSignIn().signOut();
    //   }

    //   selectedSns = DingdonguAuthType.google;
    //   final googleToken = await SocialService().signInWithGoogle();
    //   if (mounted) {
    //     context.pop(loading);
    //   }

    //   logger.d('googleToken : $googleToken');
    //   if (googleToken == null) return; // 선택 안하고 취소했을 경우

    //   DingdonguDeviceType deviceType = getDeviceType();

    //   DingdonguApiVerifySnsRequest request = DingdonguApiVerifySnsRequest(
    //     snsType: DingdonguSnsType.google,
    //     deviceType: deviceType,
    //     idToken: googleToken,
    //   );

    //   ref.read(snsVerificationAsyncNotifierProvider.notifier).snsVerify(request);
    // } catch (e) {
    //   if (mounted) {
    //     context.pop(loading);
    //   }
    // }
  }

  Future<BuildContext> showLoadingIndicator(BuildContext context) {
    var dialogContext = Completer<BuildContext>();
    showDialog(
      context: context,
      builder: (_) {
        if (!dialogContext.isCompleted) dialogContext.complete(_);
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.zero,
            // width: context.mediaQuery.size.width * 0.75,
            width: MediaQuery.of(context).size.width * 0.75,
            child: const Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
      barrierDismissible: false,
    );
    return dialogContext.future;
  }
}