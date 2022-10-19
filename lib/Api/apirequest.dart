// ignore_for_file: constant_identifier_names, depend_on_referenced_packages,

import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:localstorage/localstorage.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'dart:async';

import 'package:rapidos/Helpers/constante.dart';

const String Login = EndPoints.LOGIN;
const String Countries = EndPoints.COUNTRIES;

class BackendService {
  InterceptedClient client;
  BackendService(this.client);
  Map data = {};

  // LOGIN
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

  Future<http.Response> getCountries() async {
    final response = await client.get(
      Uri.parse(Countries),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }
}
