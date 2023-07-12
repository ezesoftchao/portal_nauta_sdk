import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'constants.dart';

class Connections{
  var result = Document();

  execute( ) async {
    var csrf = "security6008756682f52";
    var year_month = "2021-01";
    print(year_month);
    print(GET_CONNECTIONS+"?year_month=$year_month&list_type=service_detail");
    HttpClient client = new HttpClient();
    var request = await client.getUrl(Uri.parse(GET_CONNECTIONS+"?csrf=$csrf&year_month=$year_month&list_type=service_detail"));
    request.headers.set(HttpHeaders.cookieHeader, "session=ebla976lnokipgt9btonun3hc6; nauta_lang=902e8877e9e10d88e1353525cd0c159ac8f1fcf6%7Ees-es");
    request.headers.set(HttpHeaders.acceptEncodingHeader, "gzip, deflate, br");

    var response = await request.close();

    var responseBody = await response.transform(utf8.decoder).join();

    result = parse(responseBody);
    final info = result.querySelectorAll("h5.card-stats-number");

    var numberConnections = info[0].innerHtml;
    var totalTime = info[1].innerHtml;
    var totalImport = info[2].innerHtml;
    var upData = info[3].innerHtml;
    var downloadData = info[4].innerHtml;
    var totalTraffic = info[5].innerHtml;
    print(numberConnections);
    print(totalTime);
    print(totalImport);
    print(upData);
    print(downloadData);
    print(totalTraffic);



  }


}