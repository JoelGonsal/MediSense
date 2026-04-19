import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCQR3svcLDos6JR0M-JVQu-oPNzGnnNH8s",
            authDomain: "elder-ease-fkwij9.firebaseapp.com",
            projectId: "elder-ease-fkwij9",
            storageBucket: "elder-ease-fkwij9.firebasestorage.app",
            messagingSenderId: "509250005804",
            appId: "1:509250005804:web:6f63a11f2368d01cd65a89"));
  } else {
    await Firebase.initializeApp();
  }
}
