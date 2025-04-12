import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCoKqGWG1SEoMT1TvabEuxzQ6ToyMSeCVY",
            authDomain: "project-kids-bbz6he.firebaseapp.com",
            projectId: "project-kids-bbz6he",
            storageBucket: "project-kids-bbz6he.firebasestorage.app",
            messagingSenderId: "1095452666056",
            appId: "1:1095452666056:web:d104ce1cb7815f1fed1dfd"));
  } else {
    await Firebase.initializeApp();
  }
}
