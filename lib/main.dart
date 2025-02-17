import 'package:flutter/material.dart';
import 'package:myproject/week5/product_list.dart';
import 'package:myproject/firebase_test/fire_store_demo.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductList(),
    );
  }
}
