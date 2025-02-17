import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/model/product_data.dart';

class ProductFormScreen extends StatefulWidget {
  final ProductData? product; // ถ้า null แสดงว่าเป็นการเพิ่มสินค้าใหม่

  const ProductFormScreen({Key? key, this.product}) : super(key: key);

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _priceController;

  // URL API หลัก (ปรับตามโปรเจคจริง)
  final String apiUrl = "http://localhost:3000/products";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? "");
    _descController =
        TextEditingController(text: widget.product?.description ?? "");
    _priceController = TextEditingController(
        text: widget.product != null ? widget.product!.price.toString() : "");
  }

  // POST: เพิ่มสินค้าใหม่
  Future<bool> postProduct(ProductData product) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8001/products'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // PUT: แก้ไขสินค้า (ต้องมี id)
  Future<bool> putProduct(ProductData product) async {
    if (product.id == null) return false;
    final response = await http.put(
      Uri.parse("http://10.0.2.2:8001/products/${product.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<void> saveProduct() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final desc = _descController.text.trim();
      final price = double.tryParse(_priceController.text.trim()) ?? 0.0;

      // สร้าง Object ProductData
      final productData = ProductData(
        id: widget.product?.id,
        name: name,
        description: desc,
        price: price,
      );

      bool success = false;
      if (widget.product == null) {
        // เพิ่มสินค้าใหม่ด้วย POST
        success = await postProduct(productData);
      } else {
        // แก้ไขสินค้าเดิมด้วย PUT
        success = await putProduct(productData);
      }

      if (success) {
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("ไม่สามารถบันทึกสินค้าได้")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.product != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Product" : "Add Product"),
        backgroundColor: const Color.fromARGB(255, 255, 251, 36),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ชื่อสินค้า
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "กรุณากรอกชื่อสินค้า";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // รายละเอียดสินค้า
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "กรุณากรอกรายละเอียดสินค้า";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // ราคา
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "กรุณากรอกราคา";
                  }
                  if (double.tryParse(value) == null) {
                    return "กรุณากรอกเป็นตัวเลข";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: saveProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 231, 255, 93),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    isEdit ? "Save" : "Save",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
