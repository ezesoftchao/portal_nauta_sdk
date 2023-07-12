import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class LoadUserInfoDocument {
  final Dio dio;

  LoadUserInfoDocument(this.dio);

  Future<Document> execute() async {
    //TODO tratar errores de http
    final url = "https://www.portal.nauta.cu/useraaa/user_info";

    final response = await dio.get(url);

    return parse(response.data);
  }
}
