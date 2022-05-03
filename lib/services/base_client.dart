import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exceptions.dart';

class BaseClient {
  static const int timeOutDuration = 30;

  //GET
  Future<dynamic> get(String baseUrl, String api) async {
    final uri = Uri.parse(baseUrl + api);
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

//POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    final headers = {'Content-Type': 'application/json'};
    final uri = Uri.parse(baseUrl + api);
    final payload = jsonEncode(payloadObj);
    try {
      final response = await http
          .post(uri, body: payload, headers: headers)
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

//PUT
//DELETE
//OTHERS

  dynamic _processResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;
      case 422:
        throw UnprocessableException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      default:
        throw FetchDataException(
            'Error occurred with code: ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
