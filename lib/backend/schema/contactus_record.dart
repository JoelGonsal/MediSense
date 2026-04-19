import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactusRecord extends FirestoreRecord {
  ContactusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "ratings" field.
  int? _ratings;
  int get ratings => _ratings ?? 0;
  bool hasRatings() => _ratings != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _reason = snapshotData['reason'] as String?;
    _email = snapshotData['email'] as String?;
    _ratings = castToType<int>(snapshotData['ratings']);
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contactus');

  static Stream<ContactusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactusRecord.fromSnapshot(s));

  static Future<ContactusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactusRecord.fromSnapshot(s));

  static ContactusRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactusRecordData({
  String? id,
  DocumentReference? userRef,
  String? reason,
  String? email,
  int? ratings,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'userRef': userRef,
      'reason': reason,
      'email': email,
      'ratings': ratings,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactusRecordDocumentEquality implements Equality<ContactusRecord> {
  const ContactusRecordDocumentEquality();

  @override
  bool equals(ContactusRecord? e1, ContactusRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.userRef == e2?.userRef &&
        e1?.reason == e2?.reason &&
        e1?.email == e2?.email &&
        e1?.ratings == e2?.ratings &&
        e1?.link == e2?.link;
  }

  @override
  int hash(ContactusRecord? e) => const ListEquality()
      .hash([e?.id, e?.userRef, e?.reason, e?.email, e?.ratings, e?.link]);

  @override
  bool isValidKey(Object? o) => o is ContactusRecord;
}
