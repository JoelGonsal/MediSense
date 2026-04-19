// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodNutritionStruct extends FFFirebaseStruct {
  FoodNutritionStruct({
    String? productName,
    NutrientsStruct? nutrients,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productName = productName,
        _nutrients = nutrients,
        super(firestoreUtilData);

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;

  bool hasProductName() => _productName != null;

  // "nutrients" field.
  NutrientsStruct? _nutrients;
  NutrientsStruct get nutrients => _nutrients ?? NutrientsStruct();
  set nutrients(NutrientsStruct? val) => _nutrients = val;

  void updateNutrients(Function(NutrientsStruct) updateFn) {
    updateFn(_nutrients ??= NutrientsStruct());
  }

  bool hasNutrients() => _nutrients != null;

  static FoodNutritionStruct fromMap(Map<String, dynamic> data) =>
      FoodNutritionStruct(
        productName: data['productName'] as String?,
        nutrients: data['nutrients'] is NutrientsStruct
            ? data['nutrients']
            : NutrientsStruct.maybeFromMap(data['nutrients']),
      );

  static FoodNutritionStruct? maybeFromMap(dynamic data) => data is Map
      ? FoodNutritionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'productName': _productName,
        'nutrients': _nutrients?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'productName': serializeParam(
          _productName,
          ParamType.String,
        ),
        'nutrients': serializeParam(
          _nutrients,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FoodNutritionStruct fromSerializableMap(Map<String, dynamic> data) =>
      FoodNutritionStruct(
        productName: deserializeParam(
          data['productName'],
          ParamType.String,
          false,
        ),
        nutrients: deserializeStructParam(
          data['nutrients'],
          ParamType.DataStruct,
          false,
          structBuilder: NutrientsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FoodNutritionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FoodNutritionStruct &&
        productName == other.productName &&
        nutrients == other.nutrients;
  }

  @override
  int get hashCode => const ListEquality().hash([productName, nutrients]);
}

FoodNutritionStruct createFoodNutritionStruct({
  String? productName,
  NutrientsStruct? nutrients,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FoodNutritionStruct(
      productName: productName,
      nutrients: nutrients ?? (clearUnsetFields ? NutrientsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FoodNutritionStruct? updateFoodNutritionStruct(
  FoodNutritionStruct? foodNutrition, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    foodNutrition
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFoodNutritionStructData(
  Map<String, dynamic> firestoreData,
  FoodNutritionStruct? foodNutrition,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (foodNutrition == null) {
    return;
  }
  if (foodNutrition.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && foodNutrition.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final foodNutritionData =
      getFoodNutritionFirestoreData(foodNutrition, forFieldValue);
  final nestedData =
      foodNutritionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = foodNutrition.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFoodNutritionFirestoreData(
  FoodNutritionStruct? foodNutrition, [
  bool forFieldValue = false,
]) {
  if (foodNutrition == null) {
    return {};
  }
  final firestoreData = mapToFirestore(foodNutrition.toMap());

  // Handle nested data for "nutrients" field.
  addNutrientsStructData(
    firestoreData,
    foodNutrition.hasNutrients() ? foodNutrition.nutrients : null,
    'nutrients',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(foodNutrition.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFoodNutritionListFirestoreData(
  List<FoodNutritionStruct>? foodNutritions,
) =>
    foodNutritions
        ?.map((e) => getFoodNutritionFirestoreData(e, true))
        .toList() ??
    [];
