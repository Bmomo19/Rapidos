import 'package:flutter/material.dart';
import 'package:rapidos/Pages/Auth/login.dart';
import 'package:rapidos/Pages/Register/firststep.dart';
import 'package:rapidos/Pages/home.dart';

class PageRoutes {
  static const String login = 'login';
  static const String homepage = 'homepage';
  static const String firststep = 'firststep';

  Map<String, WidgetBuilder> routes() {
    return {
      login: (context) => const Login(),
      homepage: (context) => const HomePage(),
      firststep: (context) => const FirstStep(),
    };
  }
}
