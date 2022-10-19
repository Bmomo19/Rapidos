import 'package:flutter/material.dart';
import 'package:rapidos/Pages/Auth/login.dart';
import 'package:rapidos/Pages/Register/inscription.dart';
import 'package:rapidos/Pages/Register/paysderesidence.dart';
import 'package:rapidos/Pages/home.dart';

class PageRoutes {
  static const String login = 'login';
  static const String homepage = 'homepage';
  static const String paysderesidence = 'paysderesidence';
  static const String inscription = 'inscription';

  Map<String, WidgetBuilder> routes() {
    return {
      login: (context) => const Login(),
      homepage: (context) => const HomePage(),
      paysderesidence: (context) => const PaysDeResidence(),
      inscription: (context) => const Inscription(),
    };
  }
}
