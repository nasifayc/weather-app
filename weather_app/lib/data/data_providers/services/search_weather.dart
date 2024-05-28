import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/presentation/widgets/toast.dart';

class WeatherService {
  Future<Map<String, dynamic>?> searchWeather(String uri) async {
    Uri url = Uri.parse(uri);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;
        return result;
      }
    } catch (e) {
      showToast(message: 'Erroe at service $e');
    }

    return null;
  }
}
