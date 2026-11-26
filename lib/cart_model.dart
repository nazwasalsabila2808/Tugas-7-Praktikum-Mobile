
import 'package:flutter/material.dart';

class Product {
  String nama, deskripsi;
  Product(this.nama, this.deskripsi);
}

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  int get totalItems => _items.length;

  void tambahKeranjang(Product produk) {
    _items.add(produk);
    notifyListeners();
  }

  // Fungsi untuk menghapus produk dari keranjang
  void hapusKeranjang(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
