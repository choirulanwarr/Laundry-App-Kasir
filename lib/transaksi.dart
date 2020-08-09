import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Trans>> getTrans() async {
  try {
    var map = Map<String, dynamic>();
    final response = await http.post(
        "http://192.168.0.101/flutter-laundry/data_transaksi.php",
        body: map);
    print('Response: ${response.body}');
    if (200 == response.statusCode) {
      List<Trans> list = parseResponse(response.body);
      return list;
    } else {
      return List<Trans>();
    }
  } catch (e) {
    return List<Trans>();
  }
}

List<Trans> parseResponse(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Trans>((json) => Trans.fromJson(json)).toList();
}

class Trans {
  final String nama;
  final String tgl;
  final String tot;

  Trans({this.nama, this.tgl, this.tot});

  factory Trans.fromJson(Map<String, dynamic> json) {
    return Trans(
      nama: json['nama_pelanggan'] as String,
      tgl: json['tgl_order'] as String,
      tot: json['total_bayar'] as String,
    );
  }
}

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  List<Trans> _transaksi;

  @override
  void initState() {
    super.initState();
    _transaksi = [];
    _getTransaksi();
  }

  _getTransaksi() {
    getTrans().then((transaksi) {
      setState(() {
        _transaksi = transaksi;
      }); // Reset the title...
      print("Length ${transaksi.length}");
    });
  }

  // Let's create a DataTable and show the employee list in it.
  SingleChildScrollView _dataBody() {
    // Both Vertical and Horozontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                'NAMA',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'TANGGAL',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'TOTAL',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          // the list should show the filtered list now
          rows: _transaksi
              .map(
                (employee) => DataRow(cells: [
                  DataCell(
                    Text(employee.nama),
                  ),
                  DataCell(
                    Text(
                      employee.tgl.toUpperCase(),
                    ),
                  ),
                  DataCell(
                    Text(
                      employee.tot.toUpperCase(),
                    ),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 7 / 4,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 1.45),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(106),
                  bottomRight: Radius.circular(106),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.cyan[900], Colors.cyan[400]],
                ),
                color: Colors.white),
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
              top: 250,
              width: MediaQuery.of(context).size.width,
              child: _dataBody()),
          Container(
            margin: EdgeInsets.only(top: 210),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Text(
                  "Data Transaksi Laundry",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
