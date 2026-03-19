part of 'namida_storage.dart';

class _NamidaStorageIOS extends NamidaStorage {
  const _NamidaStorageIOS() : super(null);

  @override
  String getUserDataDirectory(List<String> appDataDirectories) {
    return appDataDirectories.firstOrNull ?? '';
  }

  @override
  Future<List<String>> getStorageDirectories() async {
    final docs = await pp.getApplicationDocumentsDirectory();
    return [docs.path];
  }

  @override
  Future<List<String>> getStorageDirectoriesAppData() async {
    final supportDir = await pp.getApplicationSupportDirectory();
    return [supportDir.path];
  }

  @override
  Future<List<String>> getStorageDirectoriesAppCache() async {
    final tmp = await pp.getTemporaryDirectory();
    return [tmp.path];
  }

  @override
  Future<String?> getRealPath(String? contentUri) async {
    return contentUri;
  }

  @override
  Future<List<String>> pickFiles({
    String? note,
    bool multiple = false,
    List<NamidaFileExtensionsWrapper>? allowedExtensions,
    NamidaStorageFileMemeType? memetype = NamidaStorageFileMemeType.any,
  }) async {
    try {
      FileType type = FileType.any;
      List<String>? exts;

      if (allowedExtensions != null && allowedExtensions.isNotEmpty) {
        exts = <String>[];
        allowedExtensions.loop((item) => exts!.addAll(item.extensions));
        type = FileType.custom;
      } else {
        switch (memetype) {
          case NamidaStorageFileMemeType.audio:
          case NamidaStorageFileMemeType.video:
          case NamidaStorageFileMemeType.media:
            type = FileType.media;
            break;
          case NamidaStorageFileMemeType.image:
            type = FileType.image;
            break;
          case NamidaStorageFileMemeType.any:
          case null:
            type = FileType.any;
            break;
        }
      }

      final res = await FilePicker.platform.pickFiles(
        allowMultiple: multiple,
        type: type,
        allowedExtensions: exts,
      );

      final paths = res?.files.map((e) => e.path).whereType<String>().toList() ?? <String>[];

      if (allowedExtensions != null && allowedExtensions.isNotEmpty) {
        for (final fp in paths) {
          if (fp.isNotEmpty && !allowedExtensions.any((wrapper) => wrapper.isPathValid(fp))) {
            snackyy(title: lang.error, message: '"$fp"\n${lang.extension}: ${exts?.join(', ')}', isError: true);
            return [];
          }
        }
      }

      return paths;
    } catch (e) {
      snackyy(title: lang.error, message: e.toString(), isError: true);
      return [];
    }
  }

  @override
  Future<String?> pickDirectory({String? note}) async {
    try {
      final path = await FilePicker.platform.getDirectoryPath();
      return path;
    } catch (e) {
      snackyy(title: lang.error, message: e.toString(), isError: true);
      return null;
    }
  }
}

