
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/authprovider.dart';
import '../ui/home/home_page.dart';
import 'errorscreen.dart';
import 'homepage.dart';
import 'loadingscreen.dart';
import 'loginpage.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  //  Notice here we aren't using stateless/stateful widget. Instead we are using
  //  a custom widget that is a consumer of the state.
  //  So if any data changes in the state, the widget will be updated.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  now the build method takes a new parameter ScopeReader.
    //  this object will be used to access the provider.

    //  now the following variable contains an asyncValue so now we can use .when method
    //  to imply the condition
    final _authState = ref.watch(authStateProvider);
    return _authState.when(
        data: (data) {
          if (data != null) return const HomePage();
          return const LoginPage();
        },
        loading: () => const LoadingScreen(),
        error: (e, trace) => ErrorScreen(e, trace));
  }
}