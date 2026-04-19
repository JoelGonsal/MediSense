import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'diabetes_p_d_f_widget.dart' show DiabetesPDFWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DiabetesPDFModel extends FlutterFlowModel<DiabetesPDFWidget> {
  ///  Local state fields for this component.

  double? dpfresult = 0.2;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // Stores action output result for [Custom Action - calculateDPF] action in Button widget.
  double? newout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
