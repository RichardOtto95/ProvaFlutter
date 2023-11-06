import 'dart:convert';

import 'package:http/http.dart' as http;

class WebService {
  static Future<http.Response> get(Uri url) =>
      http.get(url, headers: getHeaders());

  static Future<http.Response> post(Uri url,
          {Object? body, Encoding? encoding}) =>
      http.post(url, headers: getHeaders(), body: body, encoding: encoding);

  static Future<http.Response> patch(Uri url,
          {Object? body, Encoding? encoding}) =>
      http.patch(url, headers: getHeaders(), body: body, encoding: encoding);

  static Future<http.Response> delete(Uri url,
          {Object? body, Encoding? encoding}) =>
      http.delete(url, headers: getHeaders(), body: body, encoding: encoding);

  static Map<String, String> customHeaders = {};

  static Map<String, String> getHeaders() {
    final header = {
      'Content-Type': 'application/json',
    };
    header.addEntries(customHeaders.entries);
    return header;
  }

  static String getUrl(path) {
    return 'https://65492bd5dd8ebcd4ab244a5a.mockapi.io/api/$path';
  }

  static Uri getUri(path) => Uri.parse(getUrl(path));
}
