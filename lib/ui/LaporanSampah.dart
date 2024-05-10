import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Organik', 'Anorganik'];

class LaporanSampah extends StatefulWidget {
  const LaporanSampah({Key? key}) : super(key: key);

  @override
  State<LaporanSampah> createState() => _LaporanSampah();
}

class _LaporanSampah extends State<LaporanSampah> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text('Laporan Sampah')),
        backgroundColor: const Color.fromRGBO(0, 185, 139, 1),
      ),
      body: const Column(
        children: [
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.end,
                    "Detail sampah",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Jenis Sampah"), Text("Anorgranik")],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Jenis Sampah"), Text("Anorgranik")],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    "Total Accumulation",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Jenis Sampah"),
                      Text(
                        "1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                  SizedBox(
            height: 5,
          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Jumlah Sampah"),
                      Text(
                        "10",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                  SizedBox(
            height: 5,
          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Harga/kg"),
                      Text(
                        "IDR 20.000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                  SizedBox(
            height: 5,
          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Penghasilan"),
                      Text(
                        "IDR 200.000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
