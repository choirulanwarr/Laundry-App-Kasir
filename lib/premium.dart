import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Premium extends StatefulWidget {
  @override
  _PremiumState createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  int _qty_1 = 0;
  int _qty_2 = 0;
  int _qty_3 = 0;
  int _qty_4 = 0;
  int _total_bayar = 0;

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
      _total_bayar =
          (_qty_1 * 2000) + (_qty_2 * 2000) + (_qty_3 * 2000) + (_qty_4 * 2000);
      print(_total_bayar);
    });
  }

  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 00);

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
                colors: [Color(0xff40dedf), Color(0xff0fb2ea)],
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
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Simpan Data Laundry",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(41)),
              ),
            ),
          )
        ],
      ),
    );
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
