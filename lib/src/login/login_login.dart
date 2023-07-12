import 'exceptions/captcha_wrong_exception.dart';
import 'exceptions/user_or_password_wrong_exception.dart';

class LoadLogin {
  final String html;

  LoadLogin(this.html);

  execute() {
    if (html == null) {
      return true;
    }

    if (html.contains("Usuario desconocido o contraseña incorrecta")) {
      throw UserOrPasswordWrongException();
    }

    if (html
        .contains("El código Captcha no coincide con el valor introducido")) {
      throw CaptchaWrongException();
    }
  }
}
