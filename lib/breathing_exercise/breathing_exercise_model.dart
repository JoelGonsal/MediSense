import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'breathing_exercise_widget.dart' show BreathingExerciseWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BreathingExerciseModel extends FlutterFlowModel<BreathingExerciseWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for LottieAnimation widget.
  late bool lottieAnimationStatus;

  @override
  void initState(BuildContext context) {
    lottieAnimationStatus = false;
  }

  @override
  void dispose() {}
}
