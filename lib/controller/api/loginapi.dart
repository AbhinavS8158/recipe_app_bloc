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

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['token']; 
      } else {
        throw Exception('Login failed: Invalid username or password');
      }
    } catch (error) {
      throw Exception('Error during login: $error');
    }
  }
  
}




