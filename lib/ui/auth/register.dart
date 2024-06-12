
import 'package:amuts_project/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/register/register_cubit.dart';

class RegisterPageForm extends StatefulWidget {
  const RegisterPageForm({Key? key}) : super(key: key);

  @override
  State<RegisterPageForm> createState() => _RegisterPageForm();
}

class _RegisterPageForm extends State<RegisterPageForm> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirmed = TextEditingController();

  bool passInvisible = false;
  bool confirmPassInvisible = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, rhomescreen);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('Loading..')));
          }
          if (state is RegisterFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
          }
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.green,
              ));
            Navigator.pushNamedAndRemoveUntil(
                context, rLogin, (route) => false);
          }
        },
        child: Form(
          key: _formkey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
            child: ListView(
              children: [
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 28),
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
                    labelText: "",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //Username Field
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity),
                      border: UnderlineInputBorder(),
                      labelText: ""),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 35,
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
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the password';
                    }
                    return null;
                  },
                ),
                const Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                //Password Field
                TextFormField(
                  controller: passwordConfirmed,
                  obscureText: !confirmPassInvisible,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.check_circle_outline_rounded),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            confirmPassInvisible = !confirmPassInvisible;
                          });
                        },
                        icon: Icon(confirmPassInvisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: const UnderlineInputBorder(),
                      labelText: ""),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re enter the password';
                    }

                    if (password != passwordConfirmed) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 120,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 185, 139, 1),
                  ),
                  onPressed: () {
                    context
                        .read<RegisterCubit>()
                        .register(email: email.text, password: password.text);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Have no Account',
                        style: TextStyle(fontSize: 13, color: Colors.black)),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign in Here",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(255, 159, 62, 1)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
