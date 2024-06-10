import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Organik', 'Anorganik'];

class SetorSampah extends StatefulWidget {
  const SetorSampah({Key? key}) : super(key: key);

  @override
  State<SetorSampah> createState() => _SetorSampah();
}

class _SetorSampah extends State<SetorSampah> {
  String dropdownValue = list.first;

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
            //Navigator.pushNamed(context, '/mainmenu');
            Navigator.pop(context);
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
              margin: EdgeInsets.all(8),
              child: SizedBox(
                height: 100,
                width: 343,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 41,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
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
