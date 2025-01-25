import 'dart:convert';

import 'package:bloc_app/model/recipeModel.dart';
import 'package:http/http.dart' as http;



class ApiService {
  final String apiUrl = 'https://dummyjson.com/recipes';
Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      switch (response.statusCode) {
        case 200:
          final List<dynamic> data = jsonDecode(response.body)['recipes'];
          return data.map((json) => Recipe.fromJson(json)).toList();

        case 400:
          throw Exception('Bad Request: Invalid input.');

        case 401:
          throw Exception('Unauthorized: Please check your credentials.');

        case 403:
          throw Exception('Forbidden: You do not have permission.');

        case 404:
          throw Exception('Not Found: The requested resource could not be found.');

        case 500:
          throw Exception('Internal Server Error: Please try again later.');

        default:
          throw Exception('Unexpected error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch recipes: $e');
    }
  }
}