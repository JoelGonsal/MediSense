import '/backend/api_requests/api_calls.dart';
import '/components/disclaimer_widget.dart';
import '/components/symptomerror_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/request_manager.dart';

import 'prediction_widget.dart' show PredictionWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PredictionModel extends FlutterFlowModel<PredictionWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Symptoms Names)] action in Prediction widget.
  ApiCallResponse? apiResultgod;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // Stores action output result for [Backend Call - API (DiseasePrediction)] action in Button widget.
  ApiCallResponse? apiResultg2i;

  /// Query cache managers for this widget.

  final _symp5Manager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> symp5({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _symp5Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSymp5Cache() => _symp5Manager.clear();
  void clearSymp5CacheKey(String? uniqueKey) =>
      _symp5Manager.clearRequest(uniqueKey);

  final _symp4Manager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> symp4({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _symp4Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSymp4Cache() => _symp4Manager.clear();
  void clearSymp4CacheKey(String? uniqueKey) =>
      _symp4Manager.clearRequest(uniqueKey);

  final _sym3Manager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> sym3({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _sym3Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSym3Cache() => _sym3Manager.clear();
  void clearSym3CacheKey(String? uniqueKey) =>
      _sym3Manager.clearRequest(uniqueKey);

  final _symp2Manager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> symp2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _symp2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSymp2Cache() => _symp2Manager.clear();
  void clearSymp2CacheKey(String? uniqueKey) =>
      _symp2Manager.clearRequest(uniqueKey);

  final _symp1Manager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> symp1({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _symp1Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSymp1Cache() => _symp1Manager.clear();
  void clearSymp1CacheKey(String? uniqueKey) =>
      _symp1Manager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearSymp5Cache();

    clearSymp4Cache();

    clearSym3Cache();

    clearSymp2Cache();

    clearSymp1Cache();
  }
}
