import 'dart:developer';

import 'package:http/http.dart';

class Helper {
  /// Fungsi untuk men-generate response dari request
  ///
  /// contoh :
  /// ```
  /// Helper.generateResponse(response);
  /// "- url  : https://google.com
  ///  - code : 200
  ///  - body : <html>......</html>"
  /// ```
  static String generateResponse(Response response) {
    String? url = response.request?.url.toString();
    int statusCode = response.statusCode;
    String body = response.body;
    String msg = "- url  : $url\n- code : $statusCode\n- body : $body";
    log(msg);
    return msg;
  }
}