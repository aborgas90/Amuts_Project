import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 238, 226, 1),
      body: Center(
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
                    Navigator.pushNamed(context, '/loginForm');
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
                  Navigator.pushNamed(context, '/register');
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
                  onTap: () {},
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
    );
  }
}
