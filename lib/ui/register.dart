import 'package:flutter/material.dart';

class RegisterPageForm extends StatefulWidget {
  const RegisterPageForm({Key? key}) : super(key: key);

  @override
  State<RegisterPageForm> createState() => _RegisterPageForm();
}

class _RegisterPageForm extends State<RegisterPageForm> {
  bool passInvisible = false;
  bool confirmPassInvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/homescreen');
          },
          icon: Icon(Icons.arrow_back, ),
        ),
      ),
      body: Container(
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
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: UnderlineInputBorder(),
                  labelText: ""),
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
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  border: UnderlineInputBorder(),
                  labelText: ""),
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
            const Text(
              'Confirm Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            //Password Field
            TextFormField(
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
            ),
            const SizedBox(
              height: 120,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(0, 185, 139, 1),
              ),
              onPressed: () {},
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/homescreen');
                  },
                  child: const Text(
                    "Sign in Here",
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
