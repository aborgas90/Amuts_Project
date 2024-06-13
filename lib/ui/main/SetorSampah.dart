import 'package:amuts_project/utils/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const List<String> list = <String>['Organik', 'Anorganik'];

class SetorSampah extends StatefulWidget {
  const SetorSampah({Key? key}) : super(key: key);

  @override
  State<SetorSampah> createState() => _SetorSampah();
}

class _SetorSampah extends State<SetorSampah> {
  String dropdownValue = list.first;
  final TextEditingController jumlahController = TextEditingController();
  bool isSubmitting = false;

  Future<void> _submitData() async {
    if (jumlahController.text.isNotEmpty) {
      setState(() {
        isSubmitting = true;
      });

      try {
        await FirebaseFirestore.instance.collection('setor_sampah').add({
          'jenis_sampah': dropdownValue,
          'jumlah_sampah': double.parse(jumlahController.text),
          'timestamp': Timestamp.now(),
        });
        _showSuccessDialog();
        // Reset form after successful submission
        resetForm();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan data: $e')),
        );
      } finally {
        setState(() {
          isSubmitting = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan jumlah sampah!')),
      );
    }
  }

  void resetForm() {
    setState(() {
      dropdownValue = list.first;
      jumlahController.clear();
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SuccessDialog(),
        );
      },
    );
    // Auto close dialog after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: (const Text(
          'Setor Sampah',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Color.fromRGBO(0, 185, 139, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, rMainMenu);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Color.fromRGBO(255, 179, 0, 1),
              margin: EdgeInsets.all(8),
              child: SizedBox(
                height: 100,
                width: 343,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 41,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset('assets/images/amin.png'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Solikhul Amin',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenis Sampah',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  DropdownButtonFormField<String>(
                    hint: const Text("Pilih Jenis sampah"),
                    value: dropdownValue,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(BootstrapIcons.boxes),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          width: 100,
                          child: Text(
                            value,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Jumlah Sampah',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  TextFormField(
                    controller: jumlahController,
                    // obscureText: !passInvisible,
                    decoration: InputDecoration(
                        prefixIcon: Icon(BootstrapIcons.boxes),
                        border: UnderlineInputBorder(),
                        labelText: "Masukkan Jumlah/Kg"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: 343,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(0, 185, 139, 1)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 17))),
                  onPressed: () {},
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Dialog(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Data berhasil disimpan!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
