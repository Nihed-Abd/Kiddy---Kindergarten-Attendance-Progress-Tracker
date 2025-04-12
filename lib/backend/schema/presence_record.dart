import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PresenceRecord extends FirestoreRecord {
  PresenceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "enfant" field.
  List<DocumentReference>? _enfant;
  List<DocumentReference> get enfant => _enfant ?? const [];
  bool hasEnfant() => _enfant != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _enfant = getDataList(snapshotData['enfant']);
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Presence');

  static Stream<PresenceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PresenceRecord.fromSnapshot(s));

  static Future<PresenceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PresenceRecord.fromSnapshot(s));

  static PresenceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PresenceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PresenceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PresenceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PresenceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PresenceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPresenceRecordData({
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class PresenceRecordDocumentEquality implements Equality<PresenceRecord> {
  const PresenceRecordDocumentEquality();

  @override
  bool equals(PresenceRecord? e1, PresenceRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.enfant, e2?.enfant) && e1?.date == e2?.date;
  }

  @override
  int hash(PresenceRecord? e) =>
      const ListEquality().hash([e?.enfant, e?.date]);

  @override
  bool isValidKey(Object? o) => o is PresenceRecord;
}
