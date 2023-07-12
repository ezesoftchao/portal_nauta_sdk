import 'package:dio/dio.dart';

class LoadBytesCaptcha {
  final Dio dio;

  LoadBytesCaptcha(this.dio);

  execute() async {
    try {
      final datetime = DateTime.now().millisecondsSinceEpoch;

      final urlCaptcha = "https://www.portal.nauta.cu/captcha/?$datetime";
      Response<List<int>> rs = await dio.get<List<int>>(
        urlCaptcha,
        options: Options(
            responseType: ResponseType.bytes), // // set responseType to `bytes`
      );

      return rs.data;
    } catch (e) {
      //TOOD mandar a llamar exepction cuando no se pueda cargar la captcha
    }
  }
}
