import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _presence = prefs
              .getStringList('ff_presence')
              ?.map((path) => path.ref)
              .toList() ??
          _presence;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _Questions = [];
  List<String> get Questions => _Questions;
  set Questions(List<String> value) {
    _Questions = value;
  }

  void addToQuestions(String value) {
    Questions.add(value);
  }

  void removeFromQuestions(String value) {
    Questions.remove(value);
  }

  void removeAtIndexFromQuestions(int index) {
    Questions.removeAt(index);
  }

  void updateQuestionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Questions[index] = updateFn(_Questions[index]);
  }

  void insertAtIndexInQuestions(int index, String value) {
    Questions.insert(index, value);
  }

  List<DocumentReference> _presence = [];
  List<DocumentReference> get presence => _presence;
  set presence(List<DocumentReference> value) {
    _presence = value;
    prefs.setStringList('ff_presence', value.map((x) => x.path).toList());
  }

  void addToPresence(DocumentReference value) {
    presence.add(value);
    prefs.setStringList('ff_presence', _presence.map((x) => x.path).toList());
  }

  void removeFromPresence(DocumentReference value) {
    presence.remove(value);
    prefs.setStringList('ff_presence', _presence.map((x) => x.path).toList());
  }

  void removeAtIndexFromPresence(int index) {
    presence.removeAt(index);
    prefs.setStringList('ff_presence', _presence.map((x) => x.path).toList());
  }

  void updatePresenceAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    presence[index] = updateFn(_presence[index]);
    prefs.setStringList('ff_presence', _presence.map((x) => x.path).toList());
  }

  void insertAtIndexInPresence(int index, DocumentReference value) {
    presence.insert(index, value);
    prefs.setStringList('ff_presence', _presence.map((x) => x.path).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
