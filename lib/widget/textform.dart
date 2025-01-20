import 'package:flutter/material.dart';

class Textform extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  const Textform({super.key, required this.label, required this.controller,  required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  label: Text(
                    label,
                    style: TextStyle(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: obscureText, // Hides the password input
              ),
            );
  }
}