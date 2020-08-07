import 'package:flutter/material.dart';

class Premium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 4 / 7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff40dedf), Color(0xff0fb2ea)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Positioned(
              left: 30,
              top: 80,
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
              top: 160,
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
                    "Categories",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )),
          Positioned(
              top: 180,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    _customCard(imageUrl: "kaos.png", item: "Kaos", count: 5),
                    _customCard(
                        imageUrl: "kemeja.png", item: "Kemeja", count: 5),
                    _customCard(imageUrl: "jaket.png", item: "Jaket", count: 5),
                    _customCard(
                        imageUrl: "celana.png", item: "Celana", count: 5),
                  ],
                ),
              )),
          Positioned(
            left: 30,
            top: 640,
            right: 30,
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
                    Text(
                      "Rp. 100.000.00",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                color: Colors.blue,
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
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Text(
                          " - ",
                          style: TextStyle(fontSize: 28, letterSpacing: 3),
                        ),
                      ),
                      Text("$count"),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Text(
                          " + ",
                          style: TextStyle(fontSize: 28, letterSpacing: 1),
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
