import 'package:amuts_project/component/SettingsMenu.dart';
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
                        GestureDetector(
                          child: Icon(BootstrapIcons.three_dots_vertical),
                          onTap: () {
                            showPopover(
                              context: context,
                              bodyBuilder: (context) => SettingsMenu(),
                              onPop: () => print('Popover was popped!'),
                              direction: PopoverDirection.top,
                              backgroundColor: Colors.white,
                              width: 200,
                              height: 400,
                              arrowHeight: 15,
                              arrowWidth: 30,
                            );
                          },
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
                    children: <Widget>[
                      //Setor Sampah
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/setorsampah');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromRGBO(10, 196, 186, 1),
                                Color.fromARGB(43, 84, 231, 145)
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
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    'assets/images/setorsampah.png',
                                  ),
                                ),
                              ),
                              Text(
                                'Setor Sampah',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Laporan Sampah
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/laporansampah');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  gradient: LinearGradient(
                                      begin: Alignment.center,
                                      end: Alignment.center,
                                      colors: <Color>[
                                        Color.fromARGB(255, 49, 105, 103),
                                        Color.fromARGB(255, 213, 235, 227),
                                      ]),
                                ), // Atur warna latar belakang menjadi hijau
                                child: SizedBox(
                                  width: 60,
                                  height: 50,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/laporansampah.png'),
                                  ),
                                ),
                              ),
                              Text(
                                'Laporan Sampah',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.center,
                                    colors: <Color>[
                                      Color.fromARGB(255, 49, 105, 103),
                                      Color.fromARGB(255, 213, 235, 227),
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Color.fromRGBO(10, 196, 186, 1),
                              ), // Atur warna latar belakang menjadi hijau
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/truksampah.png'),
                                ),
                              ),
                            ),
                            Text(
                              'Truk Sampah',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  gradient: LinearGradient(
                                      begin: Alignment.center,
                                      end: Alignment.center,
                                      colors: <Color>[
                                        Color.fromARGB(255, 49, 105, 103),
                                        Color.fromARGB(255, 213, 235, 227),
                                      ]),
                                ), // Atur warna latar belakang menjadi hijau
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/kehadiran.png'),
                                  ),
                                ),
                              ),
                              Text(
                                'Kehadiran',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
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
