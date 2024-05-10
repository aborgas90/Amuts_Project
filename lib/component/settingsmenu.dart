import 'package:flutter/material.dart';

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
                child: SizedBox(
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
            Divider(),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: SizedBox(
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
            Divider(),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: SizedBox(
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
