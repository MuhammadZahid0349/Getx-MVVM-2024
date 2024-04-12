// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:getx_mvvm_2024/data/app_exceptions.dart';
import 'package:getx_mvvm_2024/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException("");
      default:
        throw FetchDataException(
            "Error occured while communicating with server" +
                response.statusCode.toString());
    }
  }
}
