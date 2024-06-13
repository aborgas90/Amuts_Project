import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editData extends StatefulWidget {
  const editData({Key? key}) : super(key: key);

  @override
  _editDataState createState() => _editDataState();
}

class _editDataState extends State<editData> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController jumlahController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  String dropdownValue = 'Organik';
  List<String> jenisSampah = ['Organik', 'Anorganik', 'B3'];

  @override
  void dispose() {
    jumlahController.dispose();
    super.dispose();
  }

  Future<void> _showEditDialog(
      BuildContext context, DocumentSnapshot document) async {
    setState(() {
      dropdownValue = document['jenis_sampah'];
      jumlahController.text = document['jumlah_sampah'].toString();
    });

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Data'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: ListBody(
                children: <Widget>[
                  DropdownButtonFormField<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: jenisSampah.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Jumlah Sampah',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan jumlah sampah';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sedang memperbarui data...'),
                      duration: Duration(seconds: 1),
                    ),
                  );

                  try {
                    await _firestore
                        .collection('setor_sampah')
                        .doc(document.id)
                        .update({
                      'jenis_sampah': dropdownValue,
                      'jumlah_sampah': double.parse(jumlahController.text)
                          .toStringAsFixed(0),
                      'timestamp': FieldValue.serverTimestamp(),
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data berhasil diperbarui'),
                      ),
                    );

                    Navigator.of(context).pop(); // Tutup dialog setelah sukses
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Gagal memperbarui data: $e'),
                      ),
                    );
                  }
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Sampah',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(0, 185, 139, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: jenisSampah.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: jumlahController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Jumlah Sampah',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan jumlah sampah';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Sedang menambahkan data...'),
                                duration: Duration(seconds: 1),
                              ),
                            );

                            try {
                              await _firestore.collection('setor_sampah').add({
                                'jenis_sampah': dropdownValue,
                                'jumlah_sampah':
                                    double.parse(jumlahController.text)
                                        .toStringAsFixed(0),
                                'timestamp': FieldValue.serverTimestamp(),
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Data berhasil ditambahkan'),
                                ),
                              );

                              Navigator.pop(
                                  context); // Tutup bottom sheet setelah sukses
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Gagal menambahkan data: $e'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Simpan'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('setor_sampah')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<DocumentSnapshot> filteredDocs =
              snapshot.data!.docs.where((doc) {
            return doc['jenis_sampah'] == dropdownValue;
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: jenisSampah.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      underline: Container(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: filteredDocs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      Timestamp? timestamp = data['timestamp'];
                      DateTime? dateTime;
                      String formattedDate = '';

                      if (timestamp != null) {
                        dateTime = timestamp.toDate();
                        formattedDate =
                            '${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
                      }

                      return Card(
                        color: const Color.fromRGBO(255, 159, 62, 1),
                        child: ListTile(
                          title: Text(
                            '${data['jenis_sampah']} (${formattedDate.isNotEmpty ? formattedDate : 'No date'})',
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            data['jumlah_sampah'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == "edit") {
                                _showEditDialog(context, document);
                              } else if (value == "delete") {
                                String documentId = document.id;
                                _firestore
                                    .collection('setor_sampah')
                                    .doc(documentId)
                                    .delete();
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              const PopupMenuItem<String>(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
