import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/exceptions.dart';

class ApiBaseHelper {
  var jsonResponse;

  Future<Map<String, dynamic>> get(String url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));

      jsonResponse = _apiResponse(response);
    } on SocketException {
      throw FetchDataException("No connection");
    } catch (e) {
      print(e);
    }
    return jsonResponse;
  }

  Map<String, dynamic> _apiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> json = jsonDecode(response.body.toString());
        return json;
        break;
      case 400:
        throw BadRequestException("Bad Request");
        break;

      default:
        throw FetchDataException("can fetch data");
    }
  }
}
