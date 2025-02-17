// product.dart
class ProductData {
  final String? id;
  final String name;
  final String description;
  final double price;

  ProductData({
    this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  // สร้าง Model จาก JSON
  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id']?.toString(),
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
    );
  }

  // แปลง Model เป็น JSON
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
