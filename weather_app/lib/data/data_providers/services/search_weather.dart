import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/presentation/widgets/toast.dart';

class WeatherService {
  Future<Map<String, dynamic>?> searchWeather(String url) async {
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
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
