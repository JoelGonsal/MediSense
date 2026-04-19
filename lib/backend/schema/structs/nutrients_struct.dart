// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutrientsStruct extends FFFirebaseStruct {
  NutrientsStruct({
    int? energy,
    int? fat,
    int? saturatedFat,
    int? carbohydrates,
    int? sugars,
    int? fiber,
    int? proteins,
    int? salt,
    int? sodium,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _energy = energy,
        _fat = fat,
        _saturatedFat = saturatedFat,
        _carbohydrates = carbohydrates,
        _sugars = sugars,
        _fiber = fiber,
        _proteins = proteins,
        _salt = salt,
        _sodium = sodium,
        super(firestoreUtilData);

  // "energy" field.
  int? _energy;
  int get energy => _energy ?? 0;
  set energy(int? val) => _energy = val;

  void incrementEnergy(int amount) => energy = energy + amount;

  bool hasEnergy() => _energy != null;

  // "fat" field.
  int? _fat;
  int get fat => _fat ?? 0;
  set fat(int? val) => _fat = val;

  void incrementFat(int amount) => fat = fat + amount;

  bool hasFat() => _fat != null;

  // "saturatedFat" field.
  int? _saturatedFat;
  int get saturatedFat => _saturatedFat ?? 0;
  set saturatedFat(int? val) => _saturatedFat = val;

  void incrementSaturatedFat(int amount) =>
      saturatedFat = saturatedFat + amount;

  bool hasSaturatedFat() => _saturatedFat != null;

  // "carbohydrates" field.
  int? _carbohydrates;
  int get carbohydrates => _carbohydrates ?? 0;
  set carbohydrates(int? val) => _carbohydrates = val;

  void incrementCarbohydrates(int amount) =>
      carbohydrates = carbohydrates + amount;

  bool hasCarbohydrates() => _carbohydrates != null;

  // "sugars" field.
  int? _sugars;
  int get sugars => _sugars ?? 0;
  set sugars(int? val) => _sugars = val;

  void incrementSugars(int amount) => sugars = sugars + amount;

  bool hasSugars() => _sugars != null;

  // "fiber" field.
  int? _fiber;
  int get fiber => _fiber ?? 0;
  set fiber(int? val) => _fiber = val;

  void incrementFiber(int amount) => fiber = fiber + amount;

  bool hasFiber() => _fiber != null;

  // "proteins" field.
  int? _proteins;
  int get proteins => _proteins ?? 0;
  set proteins(int? val) => _proteins = val;

  void incrementProteins(int amount) => proteins = proteins + amount;

  bool hasProteins() => _proteins != null;

  // "salt" field.
  int? _salt;
  int get salt => _salt ?? 0;
  set salt(int? val) => _salt = val;

  void incrementSalt(int amount) => salt = salt + amount;

  bool hasSalt() => _salt != null;

  // "sodium" field.
  int? _sodium;
  int get sodium => _sodium ?? 0;
  set sodium(int? val) => _sodium = val;

  void incrementSodium(int amount) => sodium = sodium + amount;

  bool hasSodium() => _sodium != null;

  static NutrientsStruct fromMap(Map<String, dynamic> data) => NutrientsStruct(
        energy: castToType<int>(data['energy']),
        fat: castToType<int>(data['fat']),
        saturatedFat: castToType<int>(data['saturatedFat']),
        carbohydrates: castToType<int>(data['carbohydrates']),
        sugars: castToType<int>(data['sugars']),
        fiber: castToType<int>(data['fiber']),
        proteins: castToType<int>(data['proteins']),
        salt: castToType<int>(data['salt']),
        sodium: castToType<int>(data['sodium']),
      );

  static NutrientsStruct? maybeFromMap(dynamic data) => data is Map
      ? NutrientsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'energy': _energy,
        'fat': _fat,
        'saturatedFat': _saturatedFat,
        'carbohydrates': _carbohydrates,
        'sugars': _sugars,
        'fiber': _fiber,
        'proteins': _proteins,
        'salt': _salt,
        'sodium': _sodium,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'energy': serializeParam(
          _energy,
          ParamType.int,
        ),
        'fat': serializeParam(
          _fat,
          ParamType.int,
        ),
        'saturatedFat': serializeParam(
          _saturatedFat,
          ParamType.int,
        ),
        'carbohydrates': serializeParam(
          _carbohydrates,
          ParamType.int,
        ),
        'sugars': serializeParam(
          _sugars,
          ParamType.int,
        ),
        'fiber': serializeParam(
          _fiber,
          ParamType.int,
        ),
        'proteins': serializeParam(
          _proteins,
          ParamType.int,
        ),
        'salt': serializeParam(
          _salt,
          ParamType.int,
        ),
        'sodium': serializeParam(
          _sodium,
          ParamType.int,
        ),
      }.withoutNulls;

  static NutrientsStruct fromSerializableMap(Map<String, dynamic> data) =>
      NutrientsStruct(
        energy: deserializeParam(
          data['energy'],
          ParamType.int,
          false,
        ),
        fat: deserializeParam(
          data['fat'],
          ParamType.int,
          false,
        ),
        saturatedFat: deserializeParam(
          data['saturatedFat'],
          ParamType.int,
          false,
        ),
        carbohydrates: deserializeParam(
          data['carbohydrates'],
          ParamType.int,
          false,
        ),
        sugars: deserializeParam(
          data['sugars'],
          ParamType.int,
          false,
        ),
        fiber: deserializeParam(
          data['fiber'],
          ParamType.int,
          false,
        ),
        proteins: deserializeParam(
          data['proteins'],
          ParamType.int,
          false,
        ),
        salt: deserializeParam(
          data['salt'],
          ParamType.int,
          false,
        ),
        sodium: deserializeParam(
          data['sodium'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'NutrientsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NutrientsStruct &&
        energy == other.energy &&
        fat == other.fat &&
        saturatedFat == other.saturatedFat &&
        carbohydrates == other.carbohydrates &&
        sugars == other.sugars &&
        fiber == other.fiber &&
        proteins == other.proteins &&
        salt == other.salt &&
        sodium == other.sodium;
  }

  @override
  int get hashCode => const ListEquality().hash([
        energy,
        fat,
        saturatedFat,
        carbohydrates,
        sugars,
        fiber,
        proteins,
        salt,
        sodium
      ]);
}

NutrientsStruct createNutrientsStruct({
  int? energy,
  int? fat,
  int? saturatedFat,
  int? carbohydrates,
  int? sugars,
  int? fiber,
  int? proteins,
  int? salt,
  int? sodium,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NutrientsStruct(
      energy: energy,
      fat: fat,
      saturatedFat: saturatedFat,
      carbohydrates: carbohydrates,
      sugars: sugars,
      fiber: fiber,
      proteins: proteins,
      salt: salt,
      sodium: sodium,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NutrientsStruct? updateNutrientsStruct(
  NutrientsStruct? nutrients, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nutrients
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNutrientsStructData(
  Map<String, dynamic> firestoreData,
  NutrientsStruct? nutrients,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nutrients == null) {
    return;
  }
  if (nutrients.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nutrients.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nutrientsData = getNutrientsFirestoreData(nutrients, forFieldValue);
  final nestedData = nutrientsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nutrients.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNutrientsFirestoreData(
  NutrientsStruct? nutrients, [
  bool forFieldValue = false,
]) {
  if (nutrients == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nutrients.toMap());

  // Add any Firestore field values
  mapToFirestore(nutrients.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNutrientsListFirestoreData(
  List<NutrientsStruct>? nutrientss,
) =>
    nutrientss?.map((e) => getNutrientsFirestoreData(e, true)).toList() ?? [];
