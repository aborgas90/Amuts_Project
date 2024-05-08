import 'package:amuts_project/ui/Login.dart';
import 'package:amuts_project/ui/MainMenu.dart';
import 'package:amuts_project/ui/Register.dart';
import 'package:flutter/material.dart';

MaterialPageRoute _pageRoute(
        {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);

Route? generateRoute(RouteSettings settings) {
  // ignore: no_leading_underscores_for_local_identifiers
  Route? _route;
  // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
  final _args = settings.arguments;

  switch (settings.name) {
    case rLogin:
      _route = _pageRoute(body: LoginPageForm(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: RegisterPageForm(), settings: settings);
      break;
    case rHome:
      _route = _pageRoute(body: mainMenu(), settings: settings);
      break;
  }

  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/Register';
const String rHome = '/home';