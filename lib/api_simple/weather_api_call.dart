import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myproject/model/weather_data.dart';

class WeatherApiCall extends StatefulWidget {
  const WeatherApiCall({super.key});

  @override
  State<WeatherApiCall> createState() => _WeatherApiCallState();
}

class _WeatherApiCallState extends State<WeatherApiCall> {
  WeatherData? weather;

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.waqi.info/feed/here/?token=433a05d564a3fab613d2e633c043ef564500f132"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          weather = WeatherData.fromJson(data);
        });
        print('Name: ${weather!.aqi}');
      } else {
        print("Invalid data");
      }
    } catch (e) {
      print(e);
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
    int aqiValue = int.tryParse(weather?.aqi ?? '0') ?? 0;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Air Quality Index (AQI)',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          centerTitle: true,
          backgroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: getAqiColor(aqiValue).withOpacity(0.2),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    weather!.city,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 25),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 210,
                        height: 210,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: getAqiColor(aqiValue).withOpacity(0.3),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: getAqiColor(aqiValue).withOpacity(0.8),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weather!.aqi, // ใช้ข้อมูลจาก API
                                style: const TextStyle(
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                'AQI',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    getAirQualityStatus(int.tryParse(weather?.aqi ?? '0') ?? 0),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFDDDDDD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text(
                    'Temperature',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${weather?.temperature} °C",
                    style: const TextStyle(
                        fontSize: 54, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: fetchData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Refresh',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getAirQualityStatus(int aqi) {
    if (aqi <= 50) {
      return "Good";
    } else if (aqi <= 100) {
      return "Moderate";
    } else if (aqi <= 150) {
      return "Unhealthy for Sensitive Group";
    } else if (aqi <= 200) {
      return "Unhealthy";
    } else if (aqi <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }

  Color getAqiColor(int aqi) {
    if (aqi <= 50) {
      return Colors.green;
    } else if (aqi <= 100) {
      return Colors.yellow;
    } else if (aqi <= 150) {
      return Colors.orange;
    } else if (aqi <= 200) {
      return Colors.red;
    } else if (aqi <= 300) {
      return Colors.purple;
    } else {
      return const Color.fromARGB(255, 169, 12, 12);
    }
  }
}
