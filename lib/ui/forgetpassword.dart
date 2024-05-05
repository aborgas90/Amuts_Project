import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class forgetPasswordScreen extends StatefulWidget {
  const forgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<forgetPasswordScreen> createState() => _forgetPasswordScreenState();
}

class _forgetPasswordScreenState extends State<forgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
          child: ListView(
            children: [
              const Text(
                "Forget Password",
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Email",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: UnderlineInputBorder(),
                  labelText: "",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 185, 139, 1),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/verificationOTP');
                },
                child: const Text(
                  "Send",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
