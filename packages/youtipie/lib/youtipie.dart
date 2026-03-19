/// Local stub for the original `youtipie` package.
///
/// This fork does **not** provide YouTube functionality. Any attempt to use
/// these APIs at runtime will throw [UnsupportedError].

Never _ytUnsupported() =>
    throw const UnsupportedError('YouTube features are disabled in this fork (youtipie stub).');

// A very small facade so imports like `package:youtipie/youtipie.dart`
// continue to resolve. Everything here is intentionally non-functional.

class YoutiPie {
  const YoutiPie._();

  static YoutiPie get instance => const YoutiPie._();

  @override
  noSuchMethod(Invocation invocation) => _ytUnsupported();
}

