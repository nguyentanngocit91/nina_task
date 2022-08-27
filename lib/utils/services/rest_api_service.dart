import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  Future<dynamic> get(Uri url, Map<String, String>? headers) async {
    dynamic responseJson;
    try {
      final response = await http.get(url, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkStatusException();
    }
    // print('api get received!');
    return responseJson;
  }

  Future<dynamic> post(
      Uri url, dynamic body, Map<String, String>? headers) async {
    dynamic responseJson;
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkStatusException();
    }
    // print('api post data!');
    return responseJson;
  }
}

Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // return prefs.getString(tokenKey);
}

dynamic _returnResponse(http.Response response) {
  var responseJson = jsonDecode(utf8.decode(response.bodyBytes));
  var errorResp = responseJson["message"] ?? response.body.toString();
  switch (response.statusCode) {
    case 200:
      return responseJson;
    case 201:
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(errorResp);
    case 404:
      throw NotFoundDataException(errorResp);
    case 500:
      throw InternalErrorException(errorResp);
    default:
      return FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

class ApiException implements Exception {
  final message;
  final prefix;

  ApiException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class InternalErrorException extends ApiException {
  InternalErrorException([message]) : super(message, "Internal Error: ");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super(message, "Unauthorized: ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class NotFoundDataException extends ApiException {
  NotFoundDataException([String? message]) : super(message, "Not Found Data: ");
}

class NetworkStatusException extends ApiException {
  NetworkStatusException() : super('Something went wrong.', "Oups!: ");
}
