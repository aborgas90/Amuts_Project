import 'package:amuts_project/bloc/login/login_cubit.dart';
import 'package:amuts_project/bloc/register/register_cubit.dart';
import 'package:amuts_project/firebase_options.dart';
import 'package:amuts_project/ui/HomeScreen.dart';
import 'package:amuts_project/ui/main/MainMenu.dart';
import 'package:amuts_project/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => RegisterCubit())
        ],
        child: MaterialApp(
          title: "Praktikum 6",
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return mainMenu();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              } else {
                return HomeScreen();
              }
            },
          ),
          navigatorKey: NAV_KEY,
          onGenerateRoute: generateRoute,
        ));
  }
}
