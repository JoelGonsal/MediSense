import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Youtubelink3Record extends FirestoreRecord {
  Youtubelink3Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "link3" field.
  String? _link3;
  String get link3 => _link3 ?? '';
  bool hasLink3() => _link3 != null;

  void _initializeFields() {
    _link3 = snapshotData['link3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('youtubelink3');

  static Stream<Youtubelink3Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Youtubelink3Record.fromSnapshot(s));

  static Future<Youtubelink3Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Youtubelink3Record.fromSnapshot(s));

  static Youtubelink3Record fromSnapshot(DocumentSnapshot snapshot) =>
      Youtubelink3Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Youtubelink3Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Youtubelink3Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Youtubelink3Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Youtubelink3Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYoutubelink3RecordData({
  String? link3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'link3': link3,
    }.withoutNulls,
  );

  return firestoreData;
}

class Youtubelink3RecordDocumentEquality
    implements Equality<Youtubelink3Record> {
  const Youtubelink3RecordDocumentEquality();

  @override
  bool equals(Youtubelink3Record? e1, Youtubelink3Record? e2) {
    return e1?.link3 == e2?.link3;
  }

  @override
  int hash(Youtubelink3Record? e) => const ListEquality().hash([e?.link3]);

  @override
  bool isValidKey(Object? o) => o is Youtubelink3Record;
}
