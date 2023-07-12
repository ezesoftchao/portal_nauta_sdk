import 'dart:io';

import 'package:dio/dio.dart';

class LoadLoginHtml {
  final Dio dio;

  LoadLoginHtml(this.dio);

  Future<String> execute(
      String csrf, String username, String password, String captcha) async {
    FormData formData = FormData.fromMap({
      "csrf": csrf,
      "login_user": username,
      "password_user": password,
      "captcha": captcha,
      "btn_submit": "",
    });

    final responsePost = await dio.post(
      "https://www.portal.nauta.cu/user/login/es-es",
      data: formData,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );

    final login = responsePost.headers[HttpHeaders.locationHeader] != null &&
        responsePost.data == "";

    return login ? null : responsePost.data;
  }
}
