import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicineNameeRecord extends FirestoreRecord {
  MedicineNameeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicine_namee');

  static Stream<MedicineNameeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicineNameeRecord.fromSnapshot(s));

  static Future<MedicineNameeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicineNameeRecord.fromSnapshot(s));

  static MedicineNameeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicineNameeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicineNameeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicineNameeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicineNameeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicineNameeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicineNameeRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicineNameeRecordDocumentEquality
    implements Equality<MedicineNameeRecord> {
  const MedicineNameeRecordDocumentEquality();

  @override
  bool equals(MedicineNameeRecord? e1, MedicineNameeRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(MedicineNameeRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is MedicineNameeRecord;
}
