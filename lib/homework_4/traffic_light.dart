import 'dart:async';
import 'package:flutter/material.dart';

class TrafficLightPage extends StatefulWidget {
  const TrafficLightPage({super.key});

  @override
  _TrafficLightPageState createState() => _TrafficLightPageState();
}

class _TrafficLightPageState extends State<TrafficLightPage> {
  int _lightIndex = 0;
  final List<Color> _colors = [Colors.red, Colors.yellow, Colors.green];
  final List<int> _durations = [
    20,
    3,
    15
  ]; // เวลาของแต่ละไฟ (แดง, เหลือง, เขียว)
  Timer? _timer;
  int _countdown = 5; // เริ่มต้นไฟแดงที่ 5 วินาที

  @override
  void initState() {
    super.initState();
    _startTrafficLightTimer();
  }

  void _startTrafficLightTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 1) {
          _countdown--;
        } else {
          _lightIndex = (_lightIndex + 1) % 3;
          _countdown = _durations[_lightIndex]; // รีเซ็ตเวลาตามไฟใหม่
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // ยกเลิก Timer เมื่อ Widget ถูกทำลาย
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Light'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 67, 67),
      ),
      backgroundColor: Colors.yellow[100], // ตั้งค่าพื้นหลังเป็นสีเหลืองอ่อน
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // แสดงเลขนับถอยหลังด้านบน
            Text(
              '$_countdown',
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 31, 58, 156)),
            ),
            const SizedBox(height: 20),
            Container(
              width: 120,
              height: 320,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: _lightIndex == i ? 1.0 : 0.3,
                      child: Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: _colors[i],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _lightIndex = (_lightIndex + 1) % 3;
                  _countdown = _durations[_lightIndex]; // รีเซ็ตเวลาตามไฟใหม่
                });
              },
              child: const Text('change'),
            ),
          ],
        ),
      ),
    );
  }
}
