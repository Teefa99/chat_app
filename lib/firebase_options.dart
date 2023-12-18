// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBN-O1m70s9hKLsPyglYgh23fIIEGMa3ZM',
    appId: '1:634004068730:web:33915dda195d121b355ec3',
    messagingSenderId: '634004068730',
    projectId: 'chat-app-87783',
    authDomain: 'chat-app-87783.firebaseapp.com',
    storageBucket: 'chat-app-87783.appspot.com',
    measurementId: 'G-YE2RC9BPCH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4_PXsNXHTiOSfaoSJi4hmo5gpgmPDWmk',
    appId: '1:634004068730:android:ad5ff10d436f6842355ec3',
    messagingSenderId: '634004068730',
    projectId: 'chat-app-87783',
    storageBucket: 'chat-app-87783.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3LOuZ-tz_6g9Aqj5Qy0wGO17mHDsU4pk',
    appId: '1:634004068730:ios:da9aa47a3a6a2504355ec3',
    messagingSenderId: '634004068730',
    projectId: 'chat-app-87783',
    storageBucket: 'chat-app-87783.appspot.com',
    iosBundleId: 'com.example.chat_app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3LOuZ-tz_6g9Aqj5Qy0wGO17mHDsU4pk',
    appId: '1:634004068730:ios:68b84c51ca196d9e355ec3',
    messagingSenderId: '634004068730',
    projectId: 'chat-app-87783',
    storageBucket: 'chat-app-87783.appspot.com',
    iosBundleId: 'com.example.chat_app.RunnerTests',
  );
}