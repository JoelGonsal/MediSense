// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

double calculateDPF(bool hasParentDiabetes, bool hasSiblingDiabetes,
    bool hasExtendedFamilyDiabetes) {
  double score = 0.0;

  if (hasParentDiabetes) score += 0.5;
  if (hasSiblingDiabetes) score += 0.4;
  if (hasExtendedFamilyDiabetes) score += 0.2;

  return double.parse(score.toStringAsFixed(3));
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
