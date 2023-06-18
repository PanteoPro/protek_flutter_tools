import 'package:dio/dio.dart';

enum RequestType {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  final String stringSignature;
  const RequestType(this.stringSignature);
}

abstract class BaseRequest {
  String get hostUrl;
  String get apiUrl;
  String get fullUrl {
    var mainUrl = '$hostUrl$apiUrl';
    final queryParams = getQueryParams();
    bool isFirstParam = true;
    for (final param in queryParams.entries) {
      final symbol = isFirstParam ? '?' : '&';
      mainUrl += '$symbol${param.key}=${param.value}';
      if (isFirstParam) {
        isFirstParam = false;
      }
    }
    return mainUrl;
  }

  Map<String, dynamic> getQueryParams();
  Map<String, dynamic> getBodyParams();
  RequestType get requestType;
  String contentType = Headers.jsonContentType;
  Duration timeout = const Duration(seconds: 30);
}
