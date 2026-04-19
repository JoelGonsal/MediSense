import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YoutubelinkRecord extends FirestoreRecord {
  YoutubelinkRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "link1" field.
  String? _link1;
  String get link1 => _link1 ?? '';
  bool hasLink1() => _link1 != null;

  void _initializeFields() {
    _link1 = snapshotData['link1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('youtubelink');

  static Stream<YoutubelinkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => YoutubelinkRecord.fromSnapshot(s));

  static Future<YoutubelinkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => YoutubelinkRecord.fromSnapshot(s));

  static YoutubelinkRecord fromSnapshot(DocumentSnapshot snapshot) =>
      YoutubelinkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static YoutubelinkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      YoutubelinkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'YoutubelinkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is YoutubelinkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYoutubelinkRecordData({
  String? link1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'link1': link1,
    }.withoutNulls,
  );

  return firestoreData;
}

class YoutubelinkRecordDocumentEquality implements Equality<YoutubelinkRecord> {
  const YoutubelinkRecordDocumentEquality();

  @override
  bool equals(YoutubelinkRecord? e1, YoutubelinkRecord? e2) {
    return e1?.link1 == e2?.link1;
  }

  @override
  int hash(YoutubelinkRecord? e) => const ListEquality().hash([e?.link1]);

  @override
  bool isValidKey(Object? o) => o is YoutubelinkRecord;
}
