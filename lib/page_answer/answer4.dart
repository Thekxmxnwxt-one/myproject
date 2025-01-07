import 'package:flutter/material.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Layout"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ส่วนหัว (Header)
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://scontent.fbkk17-1.fna.fbcdn.net/v/t39.30808-6/469515301_1930475180777359_5351391828402371579_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH_mou2m1fmLwPy1Mblu8ai8ll57v6mj_HyWXnu_qaP8SZtWem_jAzopAAy0XcnEN_91l5WxvegQYJLOC1r4Ub9&_nc_ohc=YH2MQXcHQxsQ7kNvgHiqscA&_nc_zt=23&_nc_ht=scontent.fbkk17-1.fna&_nc_gid=AEyJ8MVqwX4I0KVY0O13jbd&oh=00_AYCNT-wvVj2GudvD-lVrcjUI5olUMhI9qIWD7FZxiH9YKw&oe=677EC428', // URL ของรูปภาพ
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          size: 50,
                          color: Colors.red,
                        ); // ไอคอนแสดงเมื่อโหลดรูปไม่ได้
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Kamonwat Toraksa", // ชื่อผู้ใช้งาน
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // ข้อมูลโปรไฟล์
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileInfoRow(
                icon: Icons.email,
                text: "toraksa_k@silpakorn.edu",
              ),
              SizedBox(height: 10),
              ProfileInfoRow(
                icon: Icons.phone,
                text: "123-456-7890",
              ),
              SizedBox(height: 10),
              ProfileInfoRow(
                icon: Icons.location_on,
                text: "123 Main Street",
              ),
            ],
          ),
          const Spacer(), // ดันเนื้อหาก่อนหน้าไปด้านบน
          // เมนูปุ่ม
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // ฟังก์ชันแก้ไขโปรไฟล์
                  },
                  child: const Text("Edit Profile"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // ฟังก์ชันออกจากระบบ
                  },
                  child: const Text("Log out"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget สำหรับแถวข้อมูลโปรไฟล์
class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
