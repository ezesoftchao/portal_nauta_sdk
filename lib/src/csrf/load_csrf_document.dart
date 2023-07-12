import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class LoadCsrfDocument {
  final Dio dio;

  LoadCsrfDocument(this.dio);

  Future<Document> execute() async {
    final responsePost =
        await dio.get("https://www.portal.nauta.cu/user/login/es-es");
    final page = parse(responsePost.data);

    return page;
  }
}
