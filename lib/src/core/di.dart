import 'dart:io';

import 'package:dio/dio.dart';

import 'client.dart';
import 'local_manager.dart';

class Di {
  Future<Dio> clientHttp() async => await Client().dio;

  LocalManager localManager = new LocalManager();

  Future<Directory> pathLocal() async => await localManager.appDocDir();
}
