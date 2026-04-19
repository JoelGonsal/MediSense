// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> calculateBMI(String heightText, String weightText) async {
  try {
    // Convert input to double
    final heightCm = double.parse(heightText);
    final weightKg = double.parse(weightText);

    // Convert cm to meters
    final heightM = heightCm / 100;

    // Calculate BMI
    final bmi = weightKg / (heightM * heightM);

    // Optional: Category
    String category;
    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi < 25) {
      category = "Normal weight";
    } else if (bmi < 30) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    // Return formatted BMI string
    return "BMI: ${bmi.toStringAsFixed(1)} ($category)";
  } catch (e) {
    return "Invalid input";
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
