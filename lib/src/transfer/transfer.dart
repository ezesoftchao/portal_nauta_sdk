import 'package:portal_nauta/src/transfer/exceptions/destinatary_not_exist.dart';
import 'package:portal_nauta/src/transfer/exceptions/iguality_account.dart';

import 'exceptions/balance_insufficient.dart';
import 'exceptions/password_wrong.dart';

class ParseTransfer {
  final String html;

  ParseTransfer(this.html);

  execute() {
    if (html == null) {
      return true;
    }

    if (html.contains("Usuario desconocido o contraseña incorrecta")) {
      throw PasswordWrongException();
    }
    if (html.contains("La cuenta de acceso del destinatario no puede ser igual a")) {
      throw IgualityAccountException();
    }
    if (html.contains("La cuenta del destinatario no es correcta")) {
      throw DestinataryNotExistException();
    }
    if (html.contains("El importe a transferir debe ser menor que")) {
      throw BalanceInsufficientException();
    }
  }
}