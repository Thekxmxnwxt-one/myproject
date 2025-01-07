import 'package:myproject/page_answer/answer1.dart';
import 'package:myproject/page_answer/answer2.dart';
import 'package:myproject/page_answer/answer3.dart';
import 'package:myproject/page_answer/answer4.dart';
import 'package:flutter/material.dart';

class OptionAnswerPage extends StatelessWidget {
  const OptionAnswerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My answer'),
        backgroundColor: const Color.fromARGB(255, 255, 174, 92),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GridLayout()),
              );
            },
            child: const Text('Answer1'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SocialMediaLayout()),
              );
            },
            child: const Text('Answer2'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductLayout()),
              );
            },
            child: const Text('Answer3'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileLayout()),
              );
            },
            child: const Text('Answer4'),
          ),
        ]),
      ),
    );
  }
}
