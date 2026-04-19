import '/components/idkeven_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'disease_main_page_widget.dart' show DiseaseMainPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DiseaseMainPageModel extends FlutterFlowModel<DiseaseMainPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for idkevenCopy component.
  late IdkevenCopyModel idkevenCopyModel;

  @override
  void initState(BuildContext context) {
    idkevenCopyModel = createModel(context, () => IdkevenCopyModel());
  }

  @override
  void dispose() {
    idkevenCopyModel.dispose();
  }
}
