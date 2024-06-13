import 'package:amuts_project/ui/ForgetPassword.dart';
import 'package:amuts_project/ui/HomeScreen.dart';
import 'package:amuts_project/ui/LaporanSampah.dart';
import 'package:amuts_project/ui/Login.dart';
import 'package:amuts_project/ui/MainMenu.dart';
import 'package:amuts_project/ui/Register.dart';
import 'package:amuts_project/ui/SetorSampah.dart';
import 'package:amuts_project/ui/SplashScreen.dart';
import 'package:amuts_project/ui/VerificationPage.dart';
import 'package:amuts_project/ui/comingsoon.dart';
import 'package:amuts_project/ui/404.dart';
import 'package:amuts_project/ui/crud.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Amuts",
      home: const SplashScreen(),
      // theme: ThemeData(
      //   textTheme: GoogleFonts.poppinsTextTheme()
      // ),
      initialRoute: '/',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/login': (context) => const LoginPageForm(),
        '/register': (context) => const RegisterPageForm(),
        '/forgetpassword': (context) => const forgetPasswordScreen(),
        '/verificationOTP': (context) => const VerificationOTP(),
        '/mainmenu': (context) => const mainMenu(),
        '/setorsampah': (context) => const SetorSampah(),
        '/laporansampah': (context) => const LaporanSampah(),
        '/comingsoon': (context) => const ComingSoon(),
        '/404': (context) => const NotFound(),
        '/editData': (context) => const editData(),
      },
    );
  }
}
