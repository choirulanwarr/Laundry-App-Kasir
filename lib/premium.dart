import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Premium extends StatefulWidget {
  @override
  _PremiumState createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  int _qty_1 = 0; // Kaos
  int _qty_2 = 0; // Kemeja
  int _qty_3 = 0; //Jaket
  int _qty_4 = 0; //Celana

  int harga_kaos = 0;
  int harga_kemeja = 0;
  int harga_jaket = 0;
  int harga_celana = 0;

  int _total_bayar = 0;

  final nama_pelanggan = TextEditingController();

  //ambil harga dari server
  ambilHarga() async {
    final response = await http
        .get('http://192.168.0.101/flutter-laundry/get_harga_premium.php');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      data.forEach((result) {
        if (result['nama'] == "Kaos") {
          harga_kaos = int.parse(result['harga']);
        } else if (result['nama'] == "Kemeja") {
          harga_kemeja = int.parse(result['harga']);
        } else if (result['nama'] == "Jaket") {
          harga_jaket = int.parse(result['harga']);
        } else if (result['nama'] == "Celana") {
          harga_celana = int.parse(result['harga']);
        }
      });
    }
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
    }
  }

  void add(String item) {
    setState(() {
      if (item == "Kaos") {
        _qty_1++;
      } else if (item == "Kemeja") {
        _qty_2++;
      } else if (item == "Jaket") {
        _qty_3++;
      } else if (item == "Celana") {
        _qty_4++;
      }
    });
  }

  void remove(String item) {
    setState(() {
      if (item == "Kaos") {
        _qty_1--;
      } else if (item == "Kemeja") {
        _qty_2--;
      } else if (item == "Jaket") {
        _qty_3--;
      } else if (item == "Celana") {
        _qty_4--;
      }
    });
  }

  void total() {
    setState(() {
      _total_bayar = (_qty_1 * harga_kaos) +
          (_qty_2 * harga_kemeja) +
          (_qty_3 * harga_jaket) +
          (_qty_4 * harga_celana);
      print(_total_bayar);
    });
  }

  @override
  Widget build(BuildContext context) {
    ambilHarga();
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        overflow: Overflow.visible,
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
              top: 50,
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
                    "Kembali",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )),
          Positioned(
              top: 150,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    _customCard(
                        imageUrl: "kaos.png", item: "Kaos", count: _qty_1),
                    _customCard(
                        imageUrl: "kemeja.png", item: "Kemeja", count: _qty_2),
                    _customCard(
                        imageUrl: "jaket.png", item: "Jaket", count: _qty_3),
                    _customCard(
                        imageUrl: "celana.png", item: "Celana", count: _qty_4),
                  ],
                ),
              )),
          Positioned(
            left: 30,
            top: 600,
            right: 50,
            height: null,
            width: null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    _totalText(_total_bayar),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: nama_pelanggan,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle:
                          new TextStyle(color: Colors.grey[800], fontSize: 18),
                      hintText: "Nama Pelanggan",
                      fillColor: Colors.white70),
                ),
                SizedBox(height: 20),
                Container(
                  height: 80,
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      print(nama_pelanggan.text);
                      simpanTransaksi();
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
              ],
            ),
          ),
        ],
      ),
    ));
  }

  _customCard({String imageUrl, String item, String price, int count}) {
    return SizedBox(
        height: 190,
        width: 160,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/premium_images/" + imageUrl),
                  Text(
                    item,
                    style: TextStyle(fontSize: 21),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          remove(item);
                          total();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Text(
                            " - ",
                            style: TextStyle(fontSize: 28, letterSpacing: 3),
                          ),
                        ),
                      ),
                      _quantityText(count),
                      InkWell(
                        onTap: () {
                          add(item);
                          total();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Text(
                            " + ",
                            style: TextStyle(fontSize: 28, letterSpacing: 1),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _quantityText(int i) {
  return Container(
    child: Text(i.toString()),
  );
}

Widget _totalText(int i) {
  return Container(
    child: Text("Rp. " + i.toString() + ",00",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}
