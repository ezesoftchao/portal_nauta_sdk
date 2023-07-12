import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Client {
  Future<Dio> dio = clientDio();

  static Future<Dio> clientDio() async {
    Dio dio = Dio();
    final appDocDir = await getApplicationSupportDirectory();
    String cookiesPath = appDocDir.path + "/cookies/";

    var cookieJar = PersistCookieJar(dir: cookiesPath);
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));

    return dio;
  }
}
