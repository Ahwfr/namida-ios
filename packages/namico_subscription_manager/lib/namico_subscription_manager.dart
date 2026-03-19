export 'core/enum.dart';
export 'class/supabase_sub.dart';
export 'class/support_tier.dart';

class NamicoSubscriptionManager {
  static Future<void> initialize({required String dataDirectory}) async {}
  static Function(String, Object?, StackTrace?)? onError;
  static final patreon = _PatreonManager();
  static final supabase = _SupabaseManager();
  static final cacheManager = _CacheManager();
}

class _PatreonManager {
  Future<dynamic> getUserSupportTierInCacheValid() async => null;
  Future<dynamic> getUserSupportTier({dynamic login}) async => null;
  Future<dynamic> getUserSupportTierWithoutLogin() async => null;
}

class _SupabaseManager {
  Future<dynamic> getUserSubValidCache() async => null;
  Future<dynamic> getUserSubInCache() async => null;
  Future<dynamic> fetchUserValid({dynamic user}) async => null;
  Future<dynamic> claimSubscription({dynamic data}) async => null;
}

class _CacheManager {
  void deletePatreonCache() {}
}
