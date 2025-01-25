import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  Future<void> login({required String username, required String password}) async {
    Uri url = Uri.parse('https://dummyjson.com/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'expiresInMins': 30, 
        }),
      );

       switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body);
          return data['token']; 
        case 400:
          throw Exception('Bad Request: Invalid input data');
        case 401:
          throw Exception('Unauthorized: Invalid username or password');
        case 403:
          throw Exception('Forbidden: Access denied');
        case 500:
          throw Exception('Server Error: Please try again later');
        default:
          throw Exception('Login failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error during login: $error');
    }
  }
}
