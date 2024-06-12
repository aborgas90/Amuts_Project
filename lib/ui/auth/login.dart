import 'package:amuts_project/bloc/login/login_cubit.dart';
import 'package:amuts_project/ui/main/MainMenu.dart';
import 'package:amuts_project/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginPageForm extends StatefulWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  @override
  State<LoginPageForm> createState() => _LoginPageForm();
}

class _LoginPageForm extends State<LoginPageForm> {
  bool passInvisible = false;
  final email = TextEditingController();
  final password = TextEditingController();

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, rhomescreen);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
          child: ListView(
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Email',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              //email Field
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    border: UnderlineInputBorder(),
                    labelText: ""),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              //Password Field
              TextFormField(
                controller: password,
                obscureText: !passInvisible,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.check_circle_outline_rounded),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passInvisible = !passInvisible;
                        });
                      },
                      icon: Icon(passInvisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    border: UnderlineInputBorder(),
                    labelText: ""),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, rforgetpassword);
                  },
                  child: const Text("Forget Password?"),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 185, 139, 1),
                ),
                onPressed: () {
                  context
                  .read<LoginCubit>()
                      .login(email: email.text, password: password.text);
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have no Account',
                      style: TextStyle(fontSize: 13, color: Colors.black)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, rRegister);
                    },
                    child: const Text(
                      "Sign up Here",
                      style: TextStyle(
                          fontSize: 13, color: Color.fromRGBO(255, 159, 62, 1)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
