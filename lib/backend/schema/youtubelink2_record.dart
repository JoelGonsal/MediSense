import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Youtubelink2Record extends FirestoreRecord {
  Youtubelink2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "link2" field.
  String? _link2;
  String get link2 => _link2 ?? '';
  bool hasLink2() => _link2 != null;

  void _initializeFields() {
    _link2 = snapshotData['link2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('youtubelink2');

  static Stream<Youtubelink2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Youtubelink2Record.fromSnapshot(s));

  static Future<Youtubelink2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Youtubelink2Record.fromSnapshot(s));

  static Youtubelink2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Youtubelink2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Youtubelink2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Youtubelink2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Youtubelink2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Youtubelink2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYoutubelink2RecordData({
  String? link2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'link2': link2,
    }.withoutNulls,
  );

  return firestoreData;
}

class Youtubelink2RecordDocumentEquality
    implements Equality<Youtubelink2Record> {
  const Youtubelink2RecordDocumentEquality();

  @override
  bool equals(Youtubelink2Record? e1, Youtubelink2Record? e2) {
    return e1?.link2 == e2?.link2;
  }

  @override
  int hash(Youtubelink2Record? e) => const ListEquality().hash([e?.link2]);

  @override
  bool isValidKey(Object? o) => o is Youtubelink2Record;
}
