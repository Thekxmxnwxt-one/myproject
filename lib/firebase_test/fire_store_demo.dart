import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreDemo extends StatefulWidget {
  const FireStoreDemo({super.key});

  @override
  State<FireStoreDemo> createState() => _FireStoreDemoState();
}

class _FireStoreDemoState extends State<FireStoreDemo> {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: products.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        final data = snapshot.data!.docs;
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final product = data[index];
            String productId = product.id; //  ดึงค่า ID ของเอกสาร
            return ListTile(
              leading: Text(productId),
              title: Text(product['name']),
              subtitle: Text(product['description']),
            );
          },
        );
      },
    ));
  }
}
