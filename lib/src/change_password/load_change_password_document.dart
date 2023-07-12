import 'dart:io';

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class LoadChangePasswordDocument {
  final Dio dio;

  LoadChangePasswordDocument(this.dio);

  Future<String> execute(String csrf, String oldPassword, String newPassword, String repeatPassword) async {
    //TODO tratar errores de http
    FormData formData = FormData.fromMap({
      "csrf": csrf,
      "old_password": oldPassword,
      "new_password": newPassword,
      "repeat_new_password": repeatPassword,
      "btn_submit": "",
    });

    final responsePost = await dio.post(
      "https://www.portal.nauta.cu/useraaa/change_password",
      data: formData,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );

    final changePassword = responsePost.headers[HttpHeaders.locationHeader] != null &&
        responsePost.data == "";

    return changePassword ? null : responsePost.data;
  }
}



