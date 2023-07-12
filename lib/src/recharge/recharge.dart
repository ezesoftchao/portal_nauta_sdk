import 'exceptions/code_wrong.dart';

class LoadRecharge {
  final String html;

  LoadRecharge(this.html);

  execute() {
    if (html == null) {
      return true;
    }

    if (html.contains("El código de recarga es incorrecto.")) {
      throw CodeWrong();
    }
  }
}
