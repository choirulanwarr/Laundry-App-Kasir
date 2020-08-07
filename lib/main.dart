import 'package:flutter/material.dart';
import 'package:laundry_app/home.dart';
import 'package:laundry_app/kiloan.dart';
import 'package:laundry_app/premium.dart';
import 'package:laundry_app/tentang.dart';
import 'package:laundry_app/transaksi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: PageListing(),
      //Part#2. Named route using Map
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/Premium': (BuildContext context) => Premium(),
        '/Kiloan': (BuildContext context) => Kiloan(),
        '/Transaksi': (BuildContext context) => Transaksi(),
        '/Tentang': (BuildContext context) => Tentang(),
      },
    );
  }
}
