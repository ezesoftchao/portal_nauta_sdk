import 'exceptions/old_password_wrong.dart';

class LoadChangePassword {
  final String html;

  LoadChangePassword(this.html);

  execute() {
    if (html == null) {
      return true;
    }

    if (html.contains("Contraseña incorrecta.")) {
      throw OldPasswordWrongException();
    }
    if (html.contains("El campo nueva contraseña no es una contraseña fuerte. Debe tener números, caracteres especiales, mayúsculas, minúsculas y una longitud mínima de 8 caracteres y máxima de 20.")) {
      throw OldPasswordWrongException();
    }
  }
}
