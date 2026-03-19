part of 'namida_channel.dart';

class _NamidaChannelIOS extends NamidaChannel {
  _NamidaChannelIOS._internal();

  @override
  bool get canOpenFileInExplorer => false;

  @override
  Future<void>? openFileInExplorer(String filePath, {bool isDirectory = false}) => null;

  @override
  bool get supportsAppIcons => false;

  @override
  Future<bool?> isAppIconEnabled(NamidaAppIcons type) async => false;

  @override
  Future<void> changeAppIcon(NamidaAppIcons type) async {}

  @override
  Future<void> updatePipRatio({int? width, int? height}) async {}

  @override
  Future<void> setCanEnterPip(bool canEnter) async {}

  @override
  Future<void> showToast({required String message, required SnackDisplayDuration duration}) async {}

  @override
  Future<int> getPlatformSdk() async => 0;

  @override
  Future<bool> setMusicAs({required String path, required List<SetMusicAsAction> types}) async => false;

  @override
  Future<bool> openSystemEqualizer(int? sessionId) async => false;

  @override
  Future<bool> openNamidaSync(String backupFolder, String musicFoldersJoined) async => false;
}

