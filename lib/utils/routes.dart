import 'package:amuts_project/ui/auth/forgetpassword.dart';
import 'package:amuts_project/ui/HomeScreen.dart';
import 'package:amuts_project/ui/auth/login.dart';
import 'package:amuts_project/ui/auth/register.dart';
import 'package:amuts_project/ui/main/LaporanSampah.dart';
import 'package:amuts_project/ui/main/MainMenu.dart';
import 'package:amuts_project/ui/main/SetorSampah.dart';
import 'package:amuts_project/ui/auth/VerificationPage.dart';
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
    case rMainMenu:
      _route = _pageRoute(body: mainMenu(), settings: settings);
      break;
    case rhomescreen:
      _route = _pageRoute(body: HomeScreen(), settings: settings);
      break;
    case rforgetpassword:
      _route = _pageRoute(body: forgetPasswordScreen(), settings: settings);
      break;
    case rverificationOTP:
      _route = _pageRoute(body: VerificationOTP(), settings: settings);
      break;
    case rsetorSampah:
      _route = _pageRoute(body: SetorSampah(), settings: settings);
      break;
    case rlaporanSampah:
      _route = _pageRoute(body: LaporanSampah(), settings: settings);
      break;
  }

  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/Register';
const String rMainMenu = '/mainmenu';
const String rhomescreen = '/homescreen';
const String rforgetpassword = '/forgetpassword';
const String rverificationOTP = '/verificationOTP';
const String rsetorSampah = '/setorsampah';
const String rlaporanSampah = '/laporansampah';