import 'package:amuts_project/component/SettingsMenu.dart';
import 'package:amuts_project/utils/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class mainMenu extends StatefulWidget {
  const mainMenu({Key? key}) : super(key: key);

  @override
  State<mainMenu> createState() => _mainMenu();
}

class _mainMenu extends State<mainMenu> {
  int myindex = 0;
  int? tapindex;
  int? isTapp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 159, 62, 1),
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
                                    onPressed: () {},
                                    icon: const Icon(BootstrapIcons.gear),
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
              const SizedBox(
                height: 10,
              ),

              //listview
              Expanded(
                child: Container(
                  color: const Color.fromRGBO(192, 238, 226, 1),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(45),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    children: <Widget>[
                      //Setor Sampah
                      _buildMenuItem(
                        'Setor Sampah',
                        'assets/images/setorsampah.png',
                        const Color.fromRGBO(10, 196, 186, 1),
                        const Color.fromARGB(43, 84, 231, 145),
                        () {
                          Navigator.pushNamed(context, rsetorSampah);
                        },
                      ),
                      _buildMenuItem(
                        'Laporan Sampah',
                        'assets/images/laporansampah.png',
                        Colors.white,
                        Colors.white,
                        () {
                          Navigator.pushNamed(context, rlaporanSampah);
                        },
                      ),
                      _buildMenuItem(
                        'Truk Sampah',
                        'assets/images/truksampah.png',
                        Colors.white,
                        Colors.white,
                        () {},
                      ),
                      _buildMenuItem(
                        'Kehadiran',
                        'assets/images/kehadiran.png',
                        Colors.white,
                        Colors.white,
                        () {},
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

  Widget _buildMenuItem(String title, String assetPath, Color color1,
      Color color2, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color1, color2],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: color1,
                ),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(assetPath),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PopMenu extends StatelessWidget {
  PopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(
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