import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/home_images/atas.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset("assets/home_images/icon_app.png"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Premium');
                  },
                  child: _customCard(
                      imageUrl: "mdi_stars.png",
                      item: "Laundry Premium",
                      duration: "Masukan data sesuai jenis"),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Kiloan');
                  },
                  child: _customCard(
                      imageUrl: "mdi_add_shopping_cart.png",
                      item: "Laundry Kiloan",
                      duration: "Masukan data sesuai per-kilo"),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Transaksi');
                  },
                  child: _customCard(
                      imageUrl: "mdi_assignment.png",
                      item: "Data Transaksi",
                      duration: "Lihat pemasukan laundry"),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Tentang');
                  },
                  child: _customCard(
                      imageUrl: "mdi_info.png",
                      item: "Tentang Aplikasi",
                      duration: "Mengenai aplikasi ini dibuat"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       overflow: Overflow.visible,
  //       children: <Widget>[
  //         ClipPath(
  //           child: Container(
  //             width: double.infinity,
  //             height: MediaQuery.of(context).size.height * 7 / 4,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(
  //               bottom: MediaQuery.of(context).size.height / 1.45),
  //           width: double.infinity,
  //           height: double.infinity,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(106),
  //               bottomRight: Radius.circular(106),
  //             ),
  //             gradient: LinearGradient(
  //               begin: Alignment.topCenter,
  //               end: Alignment.bottomCenter,
  //               colors: [Colors.cyan[900], Colors.cyan[400]],
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //             left: 30,
  //             top: 50,
  //             right: 30,
  //             height: null,
  //             width: null,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: <Widget>[
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(100),
  //                   child: Image.asset("assets/home_images/icon_app.png"),
  //                 ),
  //                 Positioned(
  //                   top: 150,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: <Widget>[
  //                       Text("Aplikasi Kasir Laundry",
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 24,
  //                             fontWeight: FontWeight.bold,
  //                           )),
  //                       Text("UD.Bersih Kilat",
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 24,
  //                             fontWeight: FontWeight.bold,
  //                           )),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             )),
  //         Positioned(
  //           left: 20,
  //           top: 150,
  //           right: 20,
  //           child: Column(
  //             children: <Widget>[
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pushNamed(context, '/Premium');
  //                 },
  //                 child: _customCard(
  //                     imageUrl: "mdi_stars.png",
  //                     item: "Laundry Premium",
  //                     duration: "Masukan data sesuai jenis"),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pushNamed(context, '/Kiloan');
  //                 },
  //                 child: _customCard(
  //                     imageUrl: "mdi_add_shopping_cart.png",
  //                     item: "Laundry Kiloan",
  //                     duration: "Masukan data sesuai per-kilo"),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pushNamed(context, '/Transaksi');
  //                 },
  //                 child: _customCard(
  //                     imageUrl: "mdi_assignment.png",
  //                     item: "Data Transaksi",
  //                     duration: "Lihat pemasukan laundry"),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pushNamed(context, '/Tentang');
  //                 },
  //                 child: _customCard(
  //                     imageUrl: "mdi_info.png",
  //                     item: "Tentang Aplikasi",
  //                     duration: "Mengenai aplikasi ini dibuat"),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  _customCard({String imageUrl, String item, String duration}) {
    return SizedBox(
      height: 120,
      width: 350,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(width: 5, color: Colors.cyan[800])),
        elevation: 20,
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 40.0,
              ),
              Image.asset("assets/home_images/" + imageUrl),
              SizedBox(
                width: 40.0,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      duration,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

//costume background
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var controlPoint = Offset(size.width - (size.width / 2), size.height - 120);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
