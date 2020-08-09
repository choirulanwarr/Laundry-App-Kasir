import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Kiloan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 7 / 7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.cyan[800], Colors.cyan[400]],
              ),
            ),
          ),
          Positioned(
              left: 30,
              top: 40,
              right: 30,
              height: null,
              width: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assets/home_images/icon_app.png"),
                  ),
                  Positioned(
                    top: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Aplikasi Kasir Laundry",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("UD.Bersih Kilat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ],
              )),
          Positioned(
              top: 120,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Text(
                    "KEMBALI",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )),
          Positioned(
            left: 30,
            top: 160,
            right: 30,
            height: null,
            width: null,
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                child: Image.asset("assets/kiloan_images/kiloan.png"),
              ),
            ),
          ),
          Positioned(
              left: 30,
              top: 290,
              right: 30,
              height: null,
              width: null,
              child: MyCustomForm()),
        ],
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final nama_pelanggan = TextEditingController();
  final berat_pakaian = TextEditingController();
  final total_bayar = TextEditingController();

  int _total_bayar = 0;

  //Costume Dialog
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sukses"),
          content: new Text("Menyimpan Transaksi"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //simpan data transaksi
  simpanTransaksi() async {
    final response = await http
        .post("http://192.168.0.101/flutter-laundry/add_transaksi.php", body: {
      "nama_pelanggan": nama_pelanggan.text,
      "total_bayar": _total_bayar.toString()
    });
    var data = json.decode(response.body);
    print(data);
    if (data['status'] == 'OK') {
      nama_pelanggan.clear();
      berat_pakaian.clear();
      total_bayar.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Nama Pelanggan",
                fillColor: Colors.white70),
            validator: (value) {
              if (value.isEmpty) {
                return 'Masukan Nama Pelanggan';
              }
              return null;
            },
            controller: nama_pelanggan,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Berat Pakaian (kg)",
                fillColor: Colors.white70),
            validator: (value) {
              if (value.isEmpty) {
                return 'Masukan Berat Pakaian';
              }
              return null;
            },
            controller: berat_pakaian,
            onEditingComplete: () {
              _total_bayar = 1500 * int.parse(berat_pakaian.text);
              total_bayar.text = "Rp. " + (_total_bayar).toString();
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: false,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Rp. 0",
                fillColor: Colors.white70),
            controller: total_bayar,
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              child: FlatButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    simpanTransaksi();
                    // If the form is valid, display a Snackbar.
                    _showDialog();
                  }
                },
                child: Text(
                  "Simpan Data Laundry",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(41)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
