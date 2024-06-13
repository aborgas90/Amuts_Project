import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amuts_project/ui/main/crud.dart';

const List<String> list = <String>['Organik', 'Anorganik', 'B3'];

class LaporanSampah extends StatefulWidget {
  const LaporanSampah({Key? key}) : super(key: key);

  @override
  State<LaporanSampah> createState() => _LaporanSampah();
}

class _LaporanSampah extends State<LaporanSampah> {
  String dropdownValue = list.first;

  double getHargaPerKg(String jenis) {
    switch (jenis) {
      case 'Organik':
        return 5000;
      case 'Anorganik':
        return 10000;
      case 'B3':
        return 20000;
      default:
        return 0;
    }
  }

  Future<Map<String, double>> _fetchData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('setor_sampah').get();
    double totalOrganik = 0;
    double totalAnorganik = 0;
    double totalB3 = 0;

    for (var doc in snapshot.docs) {
      final data = doc.data();
      final jenisSampah = data['jenis_sampah'];
      final jumlahSampah = data['jumlah_sampah'];

      // Pastikan jumlahSampah diuraikan sebagai double
      double parsedJumlahSampah = double.tryParse(jumlahSampah.toString()) ?? 0;

      if (jenisSampah == 'Organik') {
        totalOrganik += parsedJumlahSampah;
      } else if (jenisSampah == 'Anorganik') {
        totalAnorganik += parsedJumlahSampah;
      } else if (jenisSampah == 'B3') {
        totalB3 += parsedJumlahSampah;
      }
    }

    return {
      'Organik': totalOrganik,
      'Anorganik': totalAnorganik,
      'B3': totalB3,
    };
  }

  Widget _buildSampahCard(String jenis, double totalJumlah) {
    final hargaPerKg = getHargaPerKg(jenis);
    final totalPenghasilan = totalJumlah * hargaPerKg;

    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$jenis",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Jumlah Sampah"),
                Text("${totalJumlah.toStringAsFixed(2)} Kg"),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Harga/kg"),
                Text("IDR ${hargaPerKg.toStringAsFixed(2)}"),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Penghasilan"),
                Text("IDR ${totalPenghasilan.toStringAsFixed(2)}"),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editData');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(255, 159, 62, 1), // Warna latar belakang
              ),
              child: Text(
                'Edit Data',
                style: TextStyle(color: Colors.white), // Warna teks
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Laporan Sampah',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(0, 185, 139, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final data = snapshot.data!;
          final totalOrganik = data['Organik'];
          final totalAnorganik = data['Anorganik'];
          final totalB3 = data['B3'];

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                _buildSampahCard('Organik', totalOrganik),
                _buildSampahCard('Anorganik', totalAnorganik),
                _buildSampahCard('B3', totalB3),
              ],
            ),
          );
        },
      ),
    );
  }
}
