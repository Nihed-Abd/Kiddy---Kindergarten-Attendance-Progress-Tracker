import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnfantRecord extends FirestoreRecord {
  EnfantRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomComplet" field.
  String? _nomComplet;
  String get nomComplet => _nomComplet ?? '';
  bool hasNomComplet() => _nomComplet != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  bool hasPicture() => _picture != null;

  // "dateBirth" field.
  DateTime? _dateBirth;
  DateTime? get dateBirth => _dateBirth;
  bool hasDateBirth() => _dateBirth != null;

  // "DossierMedical" field.
  String? _dossierMedical;
  String get dossierMedical => _dossierMedical ?? '';
  bool hasDossierMedical() => _dossierMedical != null;

  // "numTelParent" field.
  String? _numTelParent;
  String get numTelParent => _numTelParent ?? '';
  bool hasNumTelParent() => _numTelParent != null;

  // "motivate" field.
  String? _motivate;
  String get motivate => _motivate ?? '';
  bool hasMotivate() => _motivate != null;

  // "gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "classe" field.
  DocumentReference? _classe;
  DocumentReference? get classe => _classe;
  bool hasClasse() => _classe != null;

  void _initializeFields() {
    _nomComplet = snapshotData['nomComplet'] as String?;
    _picture = snapshotData['picture'] as String?;
    _dateBirth = snapshotData['dateBirth'] as DateTime?;
    _dossierMedical = snapshotData['DossierMedical'] as String?;
    _numTelParent = snapshotData['numTelParent'] as String?;
    _motivate = snapshotData['motivate'] as String?;
    _gender = snapshotData['gender'] is Gender
        ? snapshotData['gender']
        : deserializeEnum<Gender>(snapshotData['gender']);
    _classe = snapshotData['classe'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('enfant');

  static Stream<EnfantRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnfantRecord.fromSnapshot(s));

  static Future<EnfantRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnfantRecord.fromSnapshot(s));

  static EnfantRecord fromSnapshot(DocumentSnapshot snapshot) => EnfantRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnfantRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnfantRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnfantRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnfantRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnfantRecordData({
  String? nomComplet,
  String? picture,
  DateTime? dateBirth,
  String? dossierMedical,
  String? numTelParent,
  String? motivate,
  Gender? gender,
  DocumentReference? classe,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomComplet': nomComplet,
      'picture': picture,
      'dateBirth': dateBirth,
      'DossierMedical': dossierMedical,
      'numTelParent': numTelParent,
      'motivate': motivate,
      'gender': gender,
      'classe': classe,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnfantRecordDocumentEquality implements Equality<EnfantRecord> {
  const EnfantRecordDocumentEquality();

  @override
  bool equals(EnfantRecord? e1, EnfantRecord? e2) {
    return e1?.nomComplet == e2?.nomComplet &&
        e1?.picture == e2?.picture &&
        e1?.dateBirth == e2?.dateBirth &&
        e1?.dossierMedical == e2?.dossierMedical &&
        e1?.numTelParent == e2?.numTelParent &&
        e1?.motivate == e2?.motivate &&
        e1?.gender == e2?.gender &&
        e1?.classe == e2?.classe;
  }

  @override
  int hash(EnfantRecord? e) => const ListEquality().hash([
        e?.nomComplet,
        e?.picture,
        e?.dateBirth,
        e?.dossierMedical,
        e?.numTelParent,
        e?.motivate,
        e?.gender,
        e?.classe
      ]);

  @override
  bool isValidKey(Object? o) => o is EnfantRecord;
}
