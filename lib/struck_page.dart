import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StruckPage extends StatefulWidget {
  const StruckPage({super.key});

  @override
  State<StruckPage> createState() => _StruckPageState();
}

class _StruckPageState extends State<StruckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Struck Page"),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "NAMA TOKO",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "ALAMAT TOKO",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "TELP : 0812-3456-7890",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "NOTA NO: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],  
                  ),
                  const SizedBox(height: 20,),
                  Table( 
                  children: const [
                    TableRow(
                      children: [
                        Text("NAMA", style: TextStyle(fontWeight: FontWeight.bold,),),
                        Text("QTY", style: TextStyle(fontWeight: FontWeight.bold,),),
                        Text("HARGA", style: TextStyle(fontWeight: FontWeight.bold,),),
                        Text("JUMLAH", style: TextStyle(fontWeight: FontWeight.bold,),),
                      ]
                    ),
                    TableRow( 
                      children: [
                        Text("Mie Sedap"),
                        Text("2"),
                        Text("5000"),
                        Text("10000"),
                      ]
                    )
                  ],
                ),
                const SizedBox(height: 30,),
          
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("TOTAL: 10000",
                      style: TextStyle(fontWeight: FontWeight.bold,),),
                    ],
                  ),
                ),
          
                const SizedBox(height: 30,),
          
                const Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("JUMLAH UANG: ", style: TextStyle(fontWeight: FontWeight.bold,),),
                    Text("20000",),
                  ],
                ),
                const Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("KEMBALIAN: ", style: TextStyle(fontWeight: FontWeight.bold,),),
                    Text("10000",),
                  ],
                ),
          
                const SizedBox(height: 50,),
                const Text("Terima kasih atas kunjungannya", style: TextStyle(fontWeight: FontWeight.bold,),),
                const Text("Barang yang dibeli tidak dapat diekmbalikan.", style: TextStyle(fontWeight: FontWeight.bold,),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
