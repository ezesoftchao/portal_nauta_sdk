import 'dart:io';

import '../core/local_manager.dart';

class ReadCsrfLocal {
  final LocalManager localManager;

  ReadCsrfLocal(this.localManager);

  Future<String> execute(Directory localPath) async {
    return await localManager.readString(localPath.path + "/csrf.txt");
  }
}
