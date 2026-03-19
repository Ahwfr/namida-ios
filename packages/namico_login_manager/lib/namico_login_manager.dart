library namico_login_manager;

import 'package:flutter/widgets.dart';
import 'package:youtipie/core/enum.dart';

/// Lightweight public shim for the original `namico_login_manager`.
///
/// The app and `youtipie` only require the types below to drive the login UI.
/// The actual sign-in flow is handled in `youtipie`.

enum YoutiLoginProgress {
  starting,
  waitingForUser,
  success,
  canceled,
  failed,
}

typedef YoutiLoginProgressCallback = void Function(
  YoutiLoginProgress progress, [
  AccountCookiesValidity? cookiesValidity,
]);

class LoginPageConfiguration {
  final Widget header;
  final void Function(BuildContext context) popPage;
  final void Function(Widget page, bool opaque) pushPage;

  const LoginPageConfiguration({
    required this.header,
    required this.popPage,
    required this.pushPage,
  });
}

