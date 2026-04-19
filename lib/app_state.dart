import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _number = prefs.getString('ff_number') ?? _number;
    });
    _safeInit(() {
      _ngrok = prefs.getString('ff_ngrok') ?? _ngrok;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _PostData1 = [];
  List<dynamic> get PostData1 => _PostData1;
  set PostData1(List<dynamic> value) {
    _PostData1 = value;
  }

  void addToPostData1(dynamic value) {
    PostData1.add(value);
  }

  void removeFromPostData1(dynamic value) {
    PostData1.remove(value);
  }

  void removeAtIndexFromPostData1(int index) {
    PostData1.removeAt(index);
  }

  void updatePostData1AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    PostData1[index] = updateFn(_PostData1[index]);
  }

  void insertAtIndexInPostData1(int index, dynamic value) {
    PostData1.insert(index, value);
  }

  List<dynamic> _PostData2 = [];
  List<dynamic> get PostData2 => _PostData2;
  set PostData2(List<dynamic> value) {
    _PostData2 = value;
  }

  void addToPostData2(dynamic value) {
    PostData2.add(value);
  }

  void removeFromPostData2(dynamic value) {
    PostData2.remove(value);
  }

  void removeAtIndexFromPostData2(int index) {
    PostData2.removeAt(index);
  }

  void updatePostData2AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    PostData2[index] = updateFn(_PostData2[index]);
  }

  void insertAtIndexInPostData2(int index, dynamic value) {
    PostData2.insert(index, value);
  }

  String _pp = '';
  String get pp => _pp;
  set pp(String value) {
    _pp = value;
  }

  String _number = '';
  String get number => _number;
  set number(String value) {
    _number = value;
    prefs.setString('ff_number', value);
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  List<dynamic> _postdata3 = [];
  List<dynamic> get postdata3 => _postdata3;
  set postdata3(List<dynamic> value) {
    _postdata3 = value;
  }

  void addToPostdata3(dynamic value) {
    postdata3.add(value);
  }

  void removeFromPostdata3(dynamic value) {
    postdata3.remove(value);
  }

  void removeAtIndexFromPostdata3(int index) {
    postdata3.removeAt(index);
  }

  void updatePostdata3AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    postdata3[index] = updateFn(_postdata3[index]);
  }

  void insertAtIndexInPostdata3(int index, dynamic value) {
    postdata3.insert(index, value);
  }

  String _breathText = 'begin';
  String get breathText => _breathText;
  set breathText(String value) {
    _breathText = value;
  }

  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? value) {
    _time = value;
  }

  bool _isbreath = false;
  bool get isbreath => _isbreath;
  set isbreath(bool value) {
    _isbreath = value;
  }

  bool _DiabetesResult = false;
  bool get DiabetesResult => _DiabetesResult;
  set DiabetesResult(bool value) {
    _DiabetesResult = value;
  }

  List<String> _youtubevideo = [];
  List<String> get youtubevideo => _youtubevideo;
  set youtubevideo(List<String> value) {
    _youtubevideo = value;
  }

  void addToYoutubevideo(String value) {
    youtubevideo.add(value);
  }

  void removeFromYoutubevideo(String value) {
    youtubevideo.remove(value);
  }

  void removeAtIndexFromYoutubevideo(int index) {
    youtubevideo.removeAt(index);
  }

  void updateYoutubevideoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    youtubevideo[index] = updateFn(_youtubevideo[index]);
  }

  void insertAtIndexInYoutubevideo(int index, String value) {
    youtubevideo.insert(index, value);
  }

  String _ngrok = '';
  String get ngrok => _ngrok;
  set ngrok(String value) {
    _ngrok = value;
    prefs.setString('ff_ngrok', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
