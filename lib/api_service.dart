import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://api.api-ninjas.com/v1/quotes';

  Future<Map<String, String>> getQuote() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'X-Api-Key': '479njGvbKoeaTeuLmZF7cg==qnG32C57hdFqpU6x',
        },
      );

      final data = json.decode(response.body);

      if (data.isNotEmpty) {
        return {
          'quote': data[0]['quote'],
          'author': data[0]['author'],
        };
      } else {
        throw Exception('Not found');
      }
    } catch (e) {
      throw Exception('Error loading: $e');
    }
  }
}