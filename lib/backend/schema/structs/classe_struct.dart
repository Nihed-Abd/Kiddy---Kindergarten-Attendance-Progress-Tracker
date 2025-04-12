// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClasseStruct extends FFFirebaseStruct {
  ClasseStruct({
    String? name,
    List<DocumentReference>? students,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _students = students,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Students" field.
  List<DocumentReference>? _students;
  List<DocumentReference> get students => _students ?? const [];
  set students(List<DocumentReference>? val) => _students = val;

  void updateStudents(Function(List<DocumentReference>) updateFn) {
    updateFn(_students ??= []);
  }

  bool hasStudents() => _students != null;

  static ClasseStruct fromMap(Map<String, dynamic> data) => ClasseStruct(
        name: data['name'] as String?,
        students: getDataList(data['Students']),
      );

  static ClasseStruct? maybeFromMap(dynamic data) =>
      data is Map ? ClasseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'Students': _students,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Students': serializeParam(
          _students,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static ClasseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClasseStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        students: deserializeParam<DocumentReference>(
          data['Students'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['enfant'],
        ),
      );

  @override
  String toString() => 'ClasseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ClasseStruct &&
        name == other.name &&
        listEquality.equals(students, other.students);
  }

  @override
  int get hashCode => const ListEquality().hash([name, students]);
}

ClasseStruct createClasseStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClasseStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClasseStruct? updateClasseStruct(
  ClasseStruct? classe, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    classe
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClasseStructData(
  Map<String, dynamic> firestoreData,
  ClasseStruct? classe,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (classe == null) {
    return;
  }
  if (classe.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && classe.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final classeData = getClasseFirestoreData(classe, forFieldValue);
  final nestedData = classeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = classe.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClasseFirestoreData(
  ClasseStruct? classe, [
  bool forFieldValue = false,
]) {
  if (classe == null) {
    return {};
  }
  final firestoreData = mapToFirestore(classe.toMap());

  // Add any Firestore field values
  classe.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClasseListFirestoreData(
  List<ClasseStruct>? classes,
) =>
    classes?.map((e) => getClasseFirestoreData(e, true)).toList() ?? [];
