import 'dart:io';

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class ParseTransferDocument {
  final Dio dio;

  ParseTransferDocument(this.dio);

  Future<String> execute(String csrf, String balance, String userPassword, String accountDestinatary) async {
    //TODO tratar errores de http
    FormData formData = FormData.fromMap({
      "csrf": csrf,
      "transfer": balance,
      "password_user": userPassword,
      "id_cuenta": accountDestinatary,
      "action": "checkdata",
    });

    final responsePost = await dio.post(
      "https://www.portal.nauta.cu/useraaa/transfer_balance",
      data: formData,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );

    final transfer = responsePost.headers[HttpHeaders.locationHeader] != null &&
        responsePost.data == "";

    return transfer ? null : responsePost.data;
  }
}



