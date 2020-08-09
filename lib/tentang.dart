import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
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
          Container(
            margin: EdgeInsets.only(top: 210),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Text(
                  "Tentang Aplikasi",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text("Pemograman Mobile Lanjut",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("1. 5170411156, Milatul Ma'rifah",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      SizedBox(height: 10),
                      Text("2. 5170411156, Mumahad Eman Sulaeman",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
