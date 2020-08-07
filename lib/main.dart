import 'package:flutter/material.dart';
import 'package:laundry_app/home.dart';
import 'package:laundry_app/kiloan.dart';
import 'package:laundry_app/premium.dart';

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
      },
    );
  }
}
