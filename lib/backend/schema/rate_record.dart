import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RateRecord extends FirestoreRecord {
  RateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  bool hasRate() => _rate != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rate = castToType<int>(snapshotData['rate']);
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rate')
          : FirebaseFirestore.instance.collectionGroup('rate');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('rate').doc(id);

  static Stream<RateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RateRecord.fromSnapshot(s));

  static Future<RateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RateRecord.fromSnapshot(s));

  static RateRecord fromSnapshot(DocumentSnapshot snapshot) => RateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRateRecordData({
  int? rate,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rate': rate,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class RateRecordDocumentEquality implements Equality<RateRecord> {
  const RateRecordDocumentEquality();

  @override
  bool equals(RateRecord? e1, RateRecord? e2) {
    return e1?.rate == e2?.rate && e1?.date == e2?.date;
  }

  @override
  int hash(RateRecord? e) => const ListEquality().hash([e?.rate, e?.date]);

  @override
  bool isValidKey(Object? o) => o is RateRecord;
}
