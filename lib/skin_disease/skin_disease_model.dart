import '/backend/api_requests/api_calls.dart';
import '/components/skindisclamer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'skin_disease_widget.dart' show SkinDiseaseWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SkinDiseaseModel extends FlutterFlowModel<SkinDiseaseWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataEl7 = false;
  FFUploadedFile uploadedLocalFile_uploadDataEl7 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (skindisease)] action in Button widget.
  ApiCallResponse? apiResultk3d;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
