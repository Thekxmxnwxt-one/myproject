import 'package:flutter/material.dart';
import 'package:myproject/form_widget/form_simple.dart';
import 'package:myproject/form_widget/registration_form.dart';
import 'package:myproject/api_simple/weather_api_call.dart';

void main() {
  runApp(MyApp());
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const OptionAnswerPage(),
    );
  }
}

class GreetingWidget extends StatelessWidget {
  final String name;
  const GreetingWidget({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      'Hello, $name',
      style: const TextStyle(fontSize: 24),
    )));
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApiCall(),
    );
  }
}
