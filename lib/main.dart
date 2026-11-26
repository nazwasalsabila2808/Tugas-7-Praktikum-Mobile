import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p7_provider/cart_model.dart';
import 'package:p7_provider/productPage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Copie',
      debugShowCheckedModeBanner: false,
      home: Productpage(),
    );
  }
}
 