// ignore_for_file: constant_identifier_names, depend_on_referenced_packages,

import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:localstorage/localstorage.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rapidos/Api/Models/countries.dart';
import 'dart:async';

import 'package:rapidos/Helpers/constante.dart';

const String Login = EndPoints.LOGIN;
const String Countries = EndPoints.COUNTRIES;

class BackendService {
  InterceptedClient client;
  BackendService(this.client);
  Map data = {};

  // LOGIN
  /// It sends a POST request to the server with the data provided.
  ///
  /// Args:
  ///   data (Object): The data to be sent to the server.
  ///
  /// Returns:
  ///   A Future<http.Response>
  Future<http.Response> login(Object data) async {
    final response = await client.post(
      Uri.parse(Login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  /// It makes a GET request to the Countries API and returns the response.
  ///
  /// Returns:
  ///   A Future<http.Response> object.
  // Future<Country?> getCountries() async {
  //   final response = await client.get(
  //     Uri.parse(Countries),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     return countryFromJson(json);
  //   }
  //   return null;
  // }

  Future<CountryData?>? getCountries() async {
    var response = await http.get(Uri.parse(Countries));
    if (response.statusCode == 200) {
      var json = response.body;
      return countryFromJson(json);
    }
    return null;
  }
}
