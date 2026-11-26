
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p7_provider/cart_model.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Keranjang Anda'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(
              child: Text('Keranjang masih kosong'),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final produk = cart.items[index];

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

                  // Tombol Hapus
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      cart.hapusKeranjang(index);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${produk.nama} berhasil dihapus',
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text('Hapus'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
