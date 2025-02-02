class WeatherData {
  final String aqi;
  final String city;
  final String temperature;

  // Constructor
  WeatherData(this.aqi, this.city, this.temperature);

  // แปลง JSON เป็น Object
  WeatherData.fromJson(Map<String, dynamic> json)
      : aqi = json['data']['aqi'].toString(),
        city = json['data']['city']['name'],
        temperature = json['data']['iaqi']['t']['v'].toString();

  // แปลง Object เป็น JSON
  Map<String, dynamic> toJson() {
    return {
      'aqi': aqi,
      'city': city,
      'temperature': temperature,
    };
  }
}
