import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalManager {
  Future<File> save(List<int> bytes, String path) async {
    File file = File(path);
    return await file.writeAsBytes(bytes);
  }

  Future<File> saveString(String string, String path) async {
    File file = File(path);
    await file.writeAsString(string);
  }

  Future<String> readString(String path) async {
    try {
      final file = File(path);
      return await file.readAsString();
    } catch (e) {
      throw e;
    }
  }

  Future<Directory> appDocDir() async => await getApplicationSupportDirectory();
}
