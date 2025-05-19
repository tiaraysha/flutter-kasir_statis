import 'package:flutter/material.dart';
import 'package:kasir_statis/struck_page.dart';

class CashierPage extends StatefulWidget {
  const CashierPage({super.key});

  @override
  State<CashierPage> createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {

  List<Map<String, dynamic>> products = [ //dynamic soalnya ada int, ga string doang
    {
      "image": "assets/images/img1.png",
      "name": "Mie Sedap",
      "price": 5000,
      "stock": 10,
      "quantity":0,
    },
    {
      "image": "assets/images/img2.jpg",
      "name": "Saus",
      "price": 100000,
      "stock": 10,
      "quantity":0,
    },
    {
      "image": "assets/images/img3.jpeg",
      "name": "Susu Hilo",
      "price": 100000,
      "stock": 10,
      "quantity":0,
    },
  ];
  

  // Bikin variable di flutter
  int _totalItem = 0;
  int _totalHarga = 0;

  // TAMBAHKAN ITEM KE KERANJANG
  Future<void> _TambahItemBeli(int index) async { //Future void --> nyimpen funct, dipake nya nanti. async itu asinkron
    setState(() { //setState --> merubah widget secara realtime, misal nambah barang ke keranjang gt
      if (products[index]["stock"] > 0 ) {
        products[index]["stock"]--;
        products[index]["quantity"] = (products[index]["quantity"] ?? 0) +1;
        _totalItem ++;
        _totalHarga += products[index]["price"] as int;
        
      }
    });
  }
  Future<void> _KurangItemBeli(int index) async { //Future void --> nyimpen funct, dipake nya nanti
    setState(() { //setState --> merubah widget secara realtime, misal nambah barang ke keranjang gt
      if (products[index]["quantity"] > 0 ) {
        products[index]["stock"]++;
        products[index]["quantity"] = (products[index]["quantity"] ?? 0) -1;
        _totalItem --;
        _totalHarga -= products[index]["price"] as int;
    
      }
    });
  }
  
  final TextEditingController searchController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( //bisa masukkin banyak widget di dalemnya, jd numpuk depan belakang, semakin atas kode nya semakin bawah (?)
        children: [
          Padding(
            padding: const  EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const Text(
                  "Cashier App",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Text(
                  "Semoga harimu menyenangkan :)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari Produk...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
          
                  Expanded(
                    child: ListView.separated( //ListView --> kaya column aja gbsa di scroll, pake separated biar bs di scroll
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          decoration: BoxDecoration( 
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[300],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                    image: AssetImage(
                                      "${products[index]["image"]}",
                                    ),
                                    fit: BoxFit.cover
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                    color: Colors.grey[400],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                   Padding( 
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Column( 
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [ 
                                        Column( 
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [ 
                                            Text(
                                              "${products[index]["name"]}",
                                              style: TextStyle( 
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Stock: ${products[index]["stock"]}",
                                              style: TextStyle( 
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                              "Harga: Rp ${products[index]["price"]}",
                                              style: TextStyle( 
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                      ],
                                    ),
                                  )
                              ]),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: Row( 
                                  children: [ 
                                    Visibility( 
                                      visible: products[index]['quantity'] > 0,
                                      child: GestureDetector( 
                                        onTap: () { 
                                          if(products[index]['quantity'] > 0) {
                                            _KurangItemBeli(index);
                                          } 
                                        },
                                        child: SizedBox ( 
                                          height: 30,
                                          width: 30,
                                          child: Icon( 
                                            Icons.remove_circle_outline_rounded,
                                            color: Colors.red[400]),
                                        ),
                                        )
                                        ),                               
                                      
                                    SizedBox( 
                                      width: 40,
                                      child: Center( 
                                        child: Visibility( 
                                          visible: 
                                          products[index]['quantity'] > 0, 
                                          child: Text( 
                                            "${products[index]['quantity']}", 
                                            style: const TextStyle( 
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector( 
                                      onTap: () {
                                        if(products[index]["stock"] > 0) {
                                          _TambahItemBeli(index);
                                        } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text("Stock Kosong!"),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                      },
                                      child: const SizedBox( 
                                          height: 30,
                                          width: 30,
                                          child: Icon( 
                                            Icons.add_circle_outline_outlined,
                                            color: Colors.green,
                                          ),
                                        ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
              ],
            )
          ),
          Align( 
            alignment: Alignment.bottomCenter,
            child: InkWell( 
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StruckPage(),
                ));
              },
              child: Container( 
                margin: const EdgeInsets.all(20),
                height: 55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total ($_totalItem item) = Rp. $_totalHarga",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      )
                    ]),
                ),
              ),
            ),
          )
        ],
      )
    );
      }
  
}
