import 'package:flutter/material.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  @override
  State<LoginPageForm> createState() => _LoginPageForm();
}

class _LoginPageForm extends State<LoginPageForm> {
  bool passInvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/homescreen');
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
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
              obscureText: true,
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
                  Navigator.pushNamed(context, '/forgetpassword');
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
                Navigator.pushNamed(context, '/mainmenu');
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
                    Navigator.pushNamed(context, '/register');
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
    );
  }
}
