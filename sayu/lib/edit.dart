import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  Edit({required this.id});

  String id;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();

  var id = TextEditingController();
  var nama= TextEditingController();
  var nisn= TextEditingController();
  var kelas= TextEditingController();
  var mata_pelajaran= TextEditingController();
  var nilai= TextEditingController();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "http://localhost/uas/sayu/detail.php?id='${widget.id}'"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          id = TextEditingController(text: data['id']);
          nama = TextEditingController(text: data['nama']);
          nisn = TextEditingController(text: data['nisn']);
          kelas = TextEditingController(text: data['kelas']);
          mata_pelajaran = TextEditingController(text: data['mata_pelajaran']);
          nilai = TextEditingController(text: data['nilai']);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _onUpdate(context) async {
    try {
      return await http.post(
        Uri.parse("http://localhost/uas/sayu/update.php"),
        body: {
          "id": widget.id,
          "nama": nama.text,
          "nisn": nisn.text,
          "kelas": kelas.text,
          "mata_pelajaran": mata_pelajaran.text,
          "nilai": nilai.text,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        print(data["message"]);

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  Future _onDelete(context) async {
    try {
      return await http.post(
        Uri.parse("http://localhost/uas/sayu/delete.php"),
        body: {
          "id": widget.id,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        print(data["message"]);

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Are you sure you want to delete this?'),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Icon(Icons.cancel),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          ElevatedButton(
                            child: Icon(Icons.check_circle),
                            onPressed: () => _onDelete(context),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.delete)),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'nama',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                    hintText: "klik disini",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Title is Required!';
                  }
                  return null;
                },
              ),
              Text(
                'NISN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: nisn,
                decoration: InputDecoration(
                    hintText: "klik disini",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Title is Required!';
                  }
                  return null;
                },
              ),
              Text(
                'kelas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: kelas,
                decoration: InputDecoration(
                    hintText: "klik disini",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Title is Required!';
                  }
                  return null;
                },
              ),
              Text(
                'Mata_pelajaran',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: mata_pelajaran,
                decoration: InputDecoration(
                    hintText: "klik disini",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Title is Required!';
                  }
                  return null;
                },
              ),
              Text(
                'Nilai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: nilai,
                decoration: InputDecoration(
                    hintText: "klik disini",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fillColor: Colors.white,
                    filled: true),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Note Title is Required!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //validate
                  if (_formKey.currentState!.validate()) {
                    //send data to database with this method
                    _onUpdate(id);
                  }
                },
              )
            ],
          ),
        ),
      ),
      // body: Form(
      //   key: _formKey,
      //     child: Container(
      //       padding: EdgeInsets.all(20.0),
      //         child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //               'id',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //                   fontWeight: FontWeight.bold,
      //                      ),
      //                ),
      //           SizedBox(height: 5),
      //           TextFormField(
      //           controller: id,
      //           decoration: InputDecoration(
      //               hintText: "ketik disini",
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(15.0),
      //               ),
      //               fillColor: Colors.white,
      //               filled: true),
      //           style: const TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 16,
      //           ),
      //           validator: (value) {
      //             if (value!.isEmpty) {
      //               return 'Note Title is Required!';
      //             }
      //             return null;
      //           },
      //         ),
      //         SizedBox(height: 20),
      //         Text(
      //           'nama',
      //             style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         SizedBox(height: 5),
      //         TextFormField(
      //           controller: nama,
      //           keyboardType: TextInputType.multiline,
      //           minLines: 5,
      //           maxLines: null,
      //           decoration: InputDecoration(
      //               hintText: 'Type Note Content',
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(15.0),
      //               ),
      //               fillColor: Colors.white,
      //               filled: true),
      //           style: const TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 16,
      //           ),
      //           validator: (value) {
      //             if (value!.isEmpty) {
      //               return 'Note Content is Required!';
      //             }
      //             return null;
      //           },
      //         ),
      //         SizedBox(height: 15),
      //         ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(15),
      //             ),
      //           ),
      //           child: Text(
      //             "Submit",
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           onPressed: () {
      //             if (_formKey.currentState!.validate()) {
      //               _onUpdate(context);
      //             }
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
