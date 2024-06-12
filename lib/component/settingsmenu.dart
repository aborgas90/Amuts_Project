import 'package:amuts_project/ui/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsMenu extends StatefulWidget {
  SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenu();
}

class _SettingsMenu extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: const SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(Icons.info_outline,
                              size: 28, color: Colors.black),
                        ),
                        Text('Info',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15)),
                      ],
                    )),
              ),
            ),
            const Divider(),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: const SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(Icons.support_agent,
                              size: 28, color: Colors.black),
                        ),
                        Text('Hubungi Admin',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15)),
                      ],
                    )),
              ),
            ),
            const Divider(),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: const SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(Icons.logout_outlined,
                              size: 28, color: Colors.black),
                        ),
                        Text('Logout',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15)),
                      ],
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
