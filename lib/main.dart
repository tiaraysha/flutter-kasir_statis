import 'package:flutter/material.dart';
import 'package:kasir_statis/cashier_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //biar debug nya ilang
      title: 'Cashier App', //tittle app atau nama tab nya
      home: const CashierPage(), //tampilan awal class yg kalian panggil
    );
  }
}

