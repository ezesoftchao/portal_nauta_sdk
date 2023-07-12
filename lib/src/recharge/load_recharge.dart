import 'dart:io';

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class LoadRechargeDocument {
  final Dio dio;

  LoadRechargeDocument(this.dio);

  Future<String> execute(String csrf, String code) async {
    //TODO tratar errores de http
    FormData formData = FormData.fromMap({
      "csrf": csrf,
      "recharge_code": code,
      "btn_submit": "",
    });

    final responsePost = await dio.post(
      "https://www.portal.nauta.cu/useraaa/recharge_account",
      data: formData,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );

    final recharge = responsePost.headers[HttpHeaders.locationHeader] != null &&
        responsePost.data == "";

    return recharge ? null : responsePost.data;
  }
}



