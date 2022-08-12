
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodauth/ui/providers/cache_provider.dart';

import '../pages/loginpage.dart';
import '../utils/constants.dart';
import 'auth/email_verify_page.dart';
import 'auth/providers/auth_view_model_provider.dart';
import 'home/home_page.dart';
import 'onboarding/onboarding_page.dart';

class Root extends ConsumerWidget {
  const Root({Key? key}) : super(key: key);

  static const String route = "/root";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seen =
        ref.read(cacheProvider).value!.getBool(Constants.seen) ?? false;
    final auth = ref.read(authViewModelProvider);
    return !seen
        ? const OnboardingPage()
        : auth.user != null
            ? auth.user!.emailVerified
                ? const HomePage()
                : const EmailVerifyPage()
            : LoginPage();
  }
}
