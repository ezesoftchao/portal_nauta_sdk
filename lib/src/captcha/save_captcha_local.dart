import 'dart:io';

import 'package:portal_nauta/src/core/local_manager.dart';
import 'exceptions/save_csrf_exception.dart';

class SaveCaptchaLocal {
  final LocalManager localManager;

  SaveCaptchaLocal(this.localManager);

  Future<File> execute(Directory pathLocal, List<int> captchaBytes) async {
    try {
      return await localManager.save(
          captchaBytes, pathLocal.path + "/captcha.png");
    } catch (e) {
      throw SaveCaptchaException();
    }
  }
}
