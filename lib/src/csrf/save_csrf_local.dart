import 'dart:io';

import '../core/local_manager.dart';
import 'exceptions/save_csrf_exception.dart';

class SaveCsrfLocal {
  final LocalManager localManager;

  SaveCsrfLocal(this.localManager);

  Future<void> execute(Directory pathLocal, String csrf) async {
    try {
      await localManager.saveString(csrf, pathLocal.path + "/csrf.txt");
    } catch (e) {
      throw SaveCsrfException();
    }
  }
}
