import 'package:amuts_project/bloc/login/login_cubit.dart';
import 'package:amuts_project/ui/main/MainMenu.dart';
import 'package:amuts_project/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) async => await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => mainMenu()),
            (route) => false));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 238, 226, 1),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
        if (state is LoginLoading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Loading..')));
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.red,
            ));
        }
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.green,
            ));
          Navigator.pushNamedAndRemoveUntil(context, rMainMenu, (route) => false);
        }
      },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Image(image: AssetImage('assets/images/amutslogo.png')),
              const SizedBox(
                height: 150,
              ),
              // Button Login
              SizedBox(
                width: 343,
                height: 48,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, rLogin);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 185, 139, 1)),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 24,
              ),
              //Button Register
              SizedBox(
                width: 343,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, rRegister);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 159, 62, 1)),
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Row Button Logo Connected Firebase
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Button Google
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/images/googlelogo.png'),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  // Button Facebook
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundImage:
                          AssetImage('assets/images/facebooklogo.png'),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              // Term of Service Text
              const Text(
                'Term of service',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }
}
