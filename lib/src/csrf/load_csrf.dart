import 'package:html/dom.dart';

class LoadCsrf {
  final Document document;

  LoadCsrf(this.document);

  String execute() {
    final csrf =
        document.querySelector('input[name="csrf"]').attributes["value"];

    return csrf;
  }
}
