import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p7_provider/cartPage.dart';
import 'package:p7_provider/cart_model.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product('Laptop', 'Laptop bagus untuk streaming.'),
      Product('Mouse', 'Mouse mantap buat main PB.'),
      Product('Keyboard', 'Keyboard murah meriah.'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk Copie',
        style: TextStyle(
          fontWeight: .bold,
          fontSize: 25,
          ),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Badge(
                label: Text('${cart.totalItems}'),
                isLabelVisible: cart.totalItems > 0,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cartpage(),
                      )
                    );
                  },
                ),
              );
            } ,
          ),
          SizedBox(width: 12,)
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final produk = products[index];
          return Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.red,
                size: 30,
              ),
              title: Text(produk.nama),
              subtitle: Text(produk.deskripsi),
              trailing: IconButton(
                onPressed: (){
                  Provider.of<CartModel>(
                    context,
                    listen: false
                  ).tambahKeranjang(produk);
                },
                icon: Icon(Icons.add_circle, color: Colors.red,)
                ),
            ),
          );
        },
      ),
    );
  }
}