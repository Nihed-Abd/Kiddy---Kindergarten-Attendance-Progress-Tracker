import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClasseRecord extends FirestoreRecord {
  ClasseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Students" field.
  List<DocumentReference>? _students;
  List<DocumentReference> get students => _students ?? const [];
  bool hasStudents() => _students != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _students = getDataList(snapshotData['Students']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Classe');

  static Stream<ClasseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClasseRecord.fromSnapshot(s));

  static Future<ClasseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClasseRecord.fromSnapshot(s));

  static ClasseRecord fromSnapshot(DocumentSnapshot snapshot) => ClasseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClasseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClasseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClasseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClasseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClasseRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClasseRecordDocumentEquality implements Equality<ClasseRecord> {
  const ClasseRecordDocumentEquality();

  @override
  bool equals(ClasseRecord? e1, ClasseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.students, e2?.students);
  }

  @override
  int hash(ClasseRecord? e) =>
      const ListEquality().hash([e?.name, e?.students]);

  @override
  bool isValidKey(Object? o) => o is ClasseRecord;
}
