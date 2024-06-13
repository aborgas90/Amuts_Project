import 'package:amuts_project/component/SettingsMenu.dart';
import 'package:amuts_project/utils/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

enum ButtonState { none, setorsampah, laporansampah, truksampah, kehadiran }

class mainMenu extends StatefulWidget {
  const mainMenu({Key? key}) : super(key: key);

  @override
  State<mainMenu> createState() => _mainMenu();
}

class _mainMenu extends State<mainMenu> {
  int myindex = 0;
  int? tapindex;
  ButtonState _buttonState = ButtonState.none;

  void _handleButtonClick(ButtonState state, String route) {
    setState(() {
      _buttonState = state;
    });
    Future.delayed(Duration(milliseconds: 250), () {
      Navigator.pushNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 159, 62, 1),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 119,
                          height: 44,
                          child: Image(
                            image: AssetImage('assets/images/amutslogo.png'),
                          ),
                        ),
                        SizedBox(
                          child: PopMenu(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Selamat Datang Sumbul,",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          "Tetaplah jaga kebersihan Dengan Menukarkan Sampahmu Disini",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 25),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white),
                      width: 343,
                      height: 165,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Sampah',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color.fromRGBO(0, 185, 139,
                                        1)), // Atur warna latar belakang menjadi hijau
                                child: SizedBox(
                                  width: 39,
                                  height: 41,
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pushNamed(context, reditData);
                                    },
                                    icon: Icon(BootstrapIcons.gear),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Organik     : 612 Kg',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            'Anorganik : 76   Kg',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            'B3              : 12   Kg',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //listview
              Expanded(
                child: Container(
                  color: Color.fromRGBO(192, 238, 226, 1),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(45),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    children: <Widget>[
                      //Setor Sampah
                      InkWell(
                        onTap: () => _handleButtonClick(
                            ButtonState.setorsampah, '/setorsampah'),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: _buttonState == ButtonState.setorsampah
                                  ? [
                                      Color.fromRGBO(10, 196, 186, 1),
                                      Color.fromARGB(43, 84, 231, 145)
                                    ]
                                  : [
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 255, 255, 255)
                                    ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Color.fromRGBO(108, 199, 191, 1),
                                ), // Atur warna latar belakang menjadi hijau
                                child: SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Image.asset(
                                    _buttonState == ButtonState.setorsampah
                                        ? 'assets/images/setorsampah2.png'
                                        : 'assets/images/setorsampah.png',
                                  ),
                                ),
                              ),
                              Text(
                                'Setor Sampah',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color:
                                        _buttonState == ButtonState.setorsampah
                                            ? Colors.white
                                            : Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Laporan Sampah
                      InkWell(
                        onTap: () => _handleButtonClick(
                            ButtonState.laporansampah, '/laporansampah'),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: _buttonState == ButtonState.laporansampah
                                  ? [
                                      Color.fromRGBO(10, 196, 186, 1),
                                      Color.fromARGB(43, 84, 231, 145)
                                    ]
                                  : [
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 255, 255, 255)
                                    ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Color.fromRGBO(108, 199, 191, 1),
                                ), // Atur warna latar belakang menjadi hijau
                                child: SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Image.asset(
                                    _buttonState == ButtonState.laporansampah
                                        ? 'assets/images/laporansampah2.png'
                                        : 'assets/images/laporansampah.png',
                                  ),
                                ),
                              ),
                              Text(
                                'Laporan Sampah',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: _buttonState ==
                                            ButtonState.laporansampah
                                        ? Colors.white
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => _handleButtonClick(
                            ButtonState.truksampah, '/comingsoon'),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: _buttonState == ButtonState.truksampah
                                  ? [
                                      Color.fromRGBO(10, 196, 186, 1),
                                      Color.fromARGB(43, 84, 231, 145)
                                    ]
                                  : [
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 255, 255, 255)
                                    ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Color.fromRGBO(108, 199, 191, 1),
                                ), // Atur warna latar belakang menjadi hijau
                                child: SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Image.asset(
                                    _buttonState == ButtonState.truksampah
                                        ? 'assets/images/truksampah2.png'
                                        : 'assets/images/truksampah.png',
                                  ),
                                ),
                              ),
                              Text(
                                'Truk Sampah',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color:
                                        _buttonState == ButtonState.truksampah
                                            ? Colors.white
                                            : Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => _handleButtonClick(
                            ButtonState.kehadiran, '/comingsoon'),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: _buttonState == ButtonState.kehadiran
                                  ? [
                                      Color.fromRGBO(10, 196, 186, 1),
                                      Color.fromARGB(43, 84, 231, 145)
                                    ]
                                  : [
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 255, 255, 255)
                                    ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Color.fromRGBO(108, 199, 191, 1),
                                ), // Atur warna latar belakang menjadi hijau
                                child: SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Image.asset(
                                    _buttonState == ButtonState.kehadiran
                                        ? 'assets/images/kehadiran2.png'
                                        : 'assets/images/kehadiran.png',
                                  ),
                                ),
                              ),
                              Text(
                                'Kehadiran',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: _buttonState == ButtonState.kehadiran
                                        ? Colors.white
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromRGBO(34, 164, 93, 1),
            onTap: (index) {
              setState(() {
                myindex = index;
                // Check which index is tapped and navigate accordingly
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, '/context');
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/comingsoon');
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/comingsoon');
                    break;
                  case 3:
                    Navigator.pushNamed(context, '/comingsoon');
                    break;
                }
              });
            },
            currentIndex: myindex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  BootstrapIcons.shop_window,
                ),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                icon: Icon(BootstrapIcons.calendar2_event),
                label: "Schedule",
              ),
              BottomNavigationBarItem(
                icon: Icon(BootstrapIcons.heart),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(BootstrapIcons.person),
                label: "Profile",
              ),
            ]));
  }
}

class PopMenu extends StatelessWidget {
  PopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.more_vert,
        color: Colors.blue,
      ),
      onTap: () async {
        await showPopover(
            backgroundColor: Colors.white,
            context: context,
            constraints: const BoxConstraints(maxHeight: 200),
            transitionDuration: const Duration(milliseconds: 150),
            width: 200,
            height: 170,
            direction: PopoverDirection.bottom,
            bodyBuilder: (_) => SettingsMenu());
      },
    );
  }
}
