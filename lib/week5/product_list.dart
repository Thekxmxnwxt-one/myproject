import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myproject/model/product_data.dart';
import 'package:myproject/week5/product_form_screen.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductData> products = [];

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:8001/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          products =
              jsonList.map((item) => ProductData.fromJson(item)).toList();
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      final response =
          await http.delete(Uri.parse("http://10.0.2.2:8001/products/$id"));
      if (response.statusCode == 200 || response.statusCode == 204) {
        setState(() {
          products.removeWhere((product) => product.id == id);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("ลบสินค้าเรียบร้อย")),
        );
      } else {
        throw Exception("Failed to delete product");
      }
    } catch (e) {
      print("Error deleting product: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error deleting product: $e")),
      );
    }
  }

  // กดปุ่มแก้ไขสินค้า (ส่งข้อมูลสินค้าไปที่ฟอร์มเพื่อแก้ไข)
  Future<void> editProduct(ProductData product) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductFormScreen(product: product),
      ),
    );
    if (result == true) {
      // Refresh รายการสินค้า
      fetchData();
    }
  }

  // กดปุ่มเพิ่มสินค้าใหม่
  Future<void> addProduct() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProductFormScreen(),
      ),
    );
    if (result == true) {
      fetchData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Products',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 251, 36)),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: ListTile(
                title: Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style, // ใช้สไตล์เริ่มต้นของแอป
                    children: [
                      TextSpan(
                          text: "${product.description}\n"), // คำอธิบายสินค้า
                      TextSpan(
                        text: "${product.price.toStringAsFixed(2)} บาท", // ราคา
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                isThreeLine: true,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ปุ่มแก้ไข
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        if (product.id != null) {
                          editProduct(product);
                        }
                      },
                    ),
                    // ปุ่มลบ
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        if (product.id != null) {
                          deleteProduct(product.id!);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduct,
        backgroundColor: (Colors.lightGreenAccent),
        child: const Icon(Icons.add),
      ),
    );
  }
}
