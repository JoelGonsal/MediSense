import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/admin_access_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/features/features_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'main_copy_widget.dart' show MainCopyWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MainCopyModel extends FlutterFlowModel<MainCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FEATURES component.
  late FeaturesModel featuresModel;

  @override
  void initState(BuildContext context) {
    featuresModel = createModel(context, () => FeaturesModel());
  }

  @override
  void dispose() {
    featuresModel.dispose();
  }
}
