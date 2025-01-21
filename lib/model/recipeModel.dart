// ignore_for_file: file_names

class Recipe {
  final int id;
  final String name;
  final String imageUrl;
  final List<String>ingredients;
  final List<String>instructions;
  final int prepartiontime;

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions, 
    required this.prepartiontime
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'] ?? '', 
       ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
       prepartiontime:  json['prepTimeMinutes'],
    );
  }
}
