import 'package:flutter/material.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Layout"),
        backgroundColor: const Color.fromARGB(255, 255, 174, 92),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: 200,
            height: 50,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text(
              "Category: Electronics",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductItem(
                imageUrl:
                    'https://res.cloudinary.com/itcity-production/image/upload/f_png,q_80,w_1000/v1697691084/products/PRD202310005485/skus/selt0hkwux3bqzmde6xq.png', // ลิงก์ที่ถูกต้อง
                title: 'Laptop',
                price: '999 THB',
              ),
              ProductItem(
                imageUrl:
                    'https://i.ebayimg.com/images/g/XqQAAOSwZbJkAUnm/s-l400.jpg', // ลิงก์ที่ถูกต้อง
                title: 'Smartphone',
                price: '699 THB',
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductItem(
                imageUrl:
                    'https://image.makewebcdn.com/makeweb/m_1920x0/jxlPpOYv8/GalaxyTabS6/Samsung_Tablet_Galaxy_Tab_S6_Lite_4_64GB_Wi_Fi_SM_P610NZIATHL_Chiffon_Pink_2.jpg', // ลิงก์ที่ถูกต้อง
                title: 'Tablet',
                price: '499 THB',
              ),
              ProductItem(
                imageUrl:
                    'https://th.myfirst.tech/cdn/shop/files/676948461-4115_sfypc_cam3-p3.png?v=1732086643&width=1445', // ลิงก์ที่ถูกต้อง
                title: 'Camera',
                price: '299 THB',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget สำหรับแสดงสินค้าต่อชิ้น
class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl, // แสดงรูปจาก URL
          width: 150,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 150,
              height: 150,
              color: Colors.blueGrey,
            ); // แสดงเมื่อรูปโหลดไม่ได้
          },
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(fontSize: 14, color: Colors.green),
        ),
      ],
    );
  }
}
