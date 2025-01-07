import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid Layout"),
        backgroundColor: const Color.fromARGB(255, 255, 174, 92),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 100, height: 100, color: Colors.red),
                const SizedBox(width: 20),
                Container(width: 100, height: 100, color: Colors.green),
                const SizedBox(width: 20),
                Container(width: 100, height: 100, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 100, height: 100, color: Colors.orange),
                const SizedBox(width: 20),
                Container(width: 100, height: 100, color: Colors.purple),
                const SizedBox(width: 20),
                Container(width: 100, height: 100, color: Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
