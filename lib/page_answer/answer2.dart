import 'package:flutter/material.dart';

class SocialMediaLayout extends StatelessWidget {
  const SocialMediaLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Media Layout"),
        backgroundColor: const Color.fromARGB(255, 255, 174, 92),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
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
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kamonwat Toraksa",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "5 minites ago",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Like"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Comment"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Share"),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
