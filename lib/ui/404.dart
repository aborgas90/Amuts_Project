import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/404.png'),
              const SizedBox(height: 20),
              const Text(
                'Timeout!',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 28,
                  color: Color(0xFF3B3B3B),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Try checking your network again',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFA9A9B0),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const NotFound()),
                  );
                },
                child: const Text(
                  'Try Again',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF22A45D),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
