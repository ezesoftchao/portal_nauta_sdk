import 'package:html/dom.dart';

import 'user_info.dart';



class ParseUserInfo {
  final Document document;

  ParseUserInfo(this.document);

  UserInfo execute() {
    final Account account = new Account(
        _username,
        _email,
        _availableTime,
        _availableBalance,
        _blockDate,
        _accountType,
        _delDate,
        _serviceType);

    final HouseAccount houseAccount = new HouseAccount(
        _offer,
        _monthlyFee,
        _speedDown,
        _speedUp,
        _phone,
        _linkIdentifier,
        _linkStatus,
        _activationDate,
        _lockDate,
        _deletionDate,
        _quotaFund,
        _debt);

    return UserInfo(account,houseAccount);
  }

  get m6 {
    return document.querySelectorAll("div.m6");
  }

  String get _username {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Usuario") {
        return element
            .querySelector("p")
            .text;
      }
      return null;
    }
  }

  String get _email {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Cuenta de correo") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _availableTime {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() ==
          "Tiempo disponible de la cuenta") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _availableBalance {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Saldo disponible") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _accountType {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Tipo de cuenta") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _blockDate {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Fecha de bloqueo") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _delDate {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Fecha de eliminación") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _serviceType {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Tipo de servicio") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

//HouseAccount
  String get _offer {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Oferta") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _monthlyFee {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Cuota mensual") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _speedDown {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Velocidad de bajada") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _speedUp {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Velocidad de subida") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _phone {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Teléfono") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _linkIdentifier {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Identificador del enlace") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _linkStatus {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Estado del enlace") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _activationDate {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Fecha de activación") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _lockDate {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Fecha de bloqueo") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _deletionDate {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Fecha de eliminación") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _quotaFund {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Fondo de cuota") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _bonus {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Bono") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }

  String get _debt {
    for (var element in m6) {
      if (element
          .querySelector("h5")
          .text
          .trim() == "Deuda") {
        return element
            .querySelector("p")
            .text;
      }
    }
    return null;
  }


}


