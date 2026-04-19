import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SymptomsNamesCall {
  static Future<ApiCallResponse> call({
    List<String>? symptomsList,
  }) async {
    final symptoms = _serializeList(symptomsList);

    return ApiManager.instance.makeApiCall(
      callName: 'Symptoms Names',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/symptoms/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? symptomNAME(dynamic response) => (getJsonField(
        response,
        r'''$.symptoms''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DiseasePredictionCall {
  static Future<ApiCallResponse> call({
    String? symptom1 = '',
    String? symptom2 = '',
    String? symptom3 = '',
    String? symptom4 = '',
    String? symptom5 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "symptoms": [
    "${escapeStringForJson(symptom1)}","${escapeStringForJson(symptom2)}","${escapeStringForJson(symptom3)}","${escapeStringForJson(symptom4)}","${escapeStringForJson(symptom5)}"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DiseasePrediction',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/predict/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? disease(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.predicted_disease''',
      ));
  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  static List<String>? precaution(dynamic response) => (getJsonField(
        response,
        r'''$.precautions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? medication(dynamic response) => (getJsonField(
        response,
        r'''$.medications''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? diet(dynamic response) => (getJsonField(
        response,
        r'''$.diet_recommendations''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workout(dynamic response) => (getJsonField(
        response,
        r'''$.recommended_workouts''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TipsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'tips',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/tips/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? tip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tip''',
      ));
}

class EmergencyCallCall {
  static Future<ApiCallResponse> call({
    String? number = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contact_number": "${escapeStringForJson(number)}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'emergency call',
      apiUrl:
          'https://d23e-103-181-59-107.ngrok-free.app/send_emergency_message',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? emermessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class IdentificationCall {
  static Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "medicine_name": "${escapeStringForJson(name)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Identification',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/medicine',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StatusCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'status',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/status/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SkindiseaseCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'skindisease',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/skindisease/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DiabetesCall {
  static Future<ApiCallResponse> call({
    double? pregnancies,
    double? glucose,
    double? bloodPressure,
    double? skinThickness,
    double? insulin,
    double? bmi,
    double? diabetesPedigreeFunction,
    double? age,
  }) async {
    final ffApiRequestBody = '''
{
  "Pregnancies": ${pregnancies},
  "Glucose": ${glucose},
  "BloodPressure": ${bloodPressure},
  "SkinThickness": ${skinThickness},
  "Insulin": ${insulin},
  "BMI": ${bmi},
  "DiabetesPedigreeFunction": ${diabetesPedigreeFunction},
  "Age": ${age}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'diabetes',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/dia',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SuggestCall {
  static Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "${escapeStringForJson(query)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'suggest',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/suggest',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? sugg(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class StressCall {
  static Future<ApiCallResponse> call({
    double? input1,
    double? input2,
    double? input3,
    double? input4,
    double? input5,
    double? input6,
    double? input7,
    double? input8,
    double? input9,
    double? input10,
    double? input11,
  }) async {
    final ffApiRequestBody = '''
{
  "anxiety_level": ${input1},
  "mental_health_history": ${input2},
  "depression":${input3},
  "headache":${input4},
  "sleep_quality":${input5},
  "breathing_problem": ${input6},
  "living_conditions": ${input7},
  "academic_performance":${input8},
  "study_load": ${input9},
  "future_career_concerns": ${input10},
  "extracurricular_activities": ${input11}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'stress',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/stress/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestingCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'testing',
      apiUrl: 'https://db35-14-139-125-231.ngrok-free.app/symptoms',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
