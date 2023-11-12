import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:366640601680:ios:9d686f0dd8b50dde16cf55',
        apiKey: 'AIzaSyCi3umnQPultHVC03dyr9pt8RddN3vp77c',
        projectId: 'lwp-e-commerce',
        messagingSenderId: '366640601680',
        iosBundleId: 'com.example.eCommerce',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:366640601680:android:9a5d140a67ac9f4616cf55',
        apiKey: 'AIzaSyCM1uyDZugGDw_sO4Fs8B1aiymGvz03uyk',
        projectId: 'lwp-e-commerce',
        messagingSenderId: '366640601680',
      );
    }
  }
}