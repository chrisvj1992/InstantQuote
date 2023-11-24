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
    apiKey: 'AIzaSyDeYjjZ_agcvBSkNQNEYSFt6nIvj0xLGMs',
    appId: '1:868124630484:web:5c890fcd88e41b40cf4a41',
    messagingSenderId: '868124630484',
    projectId: 'instantquote-997f3',
    authDomain: 'instantquote-997f3.firebaseapp.com',
    databaseURL: 'https://instantquote-997f3-default-rtdb.firebaseio.com',
    storageBucket: 'instantquote-997f3.appspot.com',
    measurementId: 'G-R7RZWQ55FY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpZD0K9wJKoOSdytba-I0q7SDOOuZpUQs',
    appId: '1:868124630484:android:a1b7d3488a5cef28cf4a41',
    messagingSenderId: '868124630484',
    projectId: 'instantquote-997f3',
    databaseURL: 'https://instantquote-997f3-default-rtdb.firebaseio.com',
    storageBucket: 'instantquote-997f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUi8dNe7n5KPhO_kk7_dDmMGuWlXHCzww',
    appId: '1:868124630484:ios:95b73acee7f51562cf4a41',
    messagingSenderId: '868124630484',
    projectId: 'instantquote-997f3',
    databaseURL: 'https://instantquote-997f3-default-rtdb.firebaseio.com',
    storageBucket: 'instantquote-997f3.appspot.com',
    iosBundleId: 'com.example.instantQuote',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUi8dNe7n5KPhO_kk7_dDmMGuWlXHCzww',
    appId: '1:868124630484:ios:333af6550d4dda17cf4a41',
    messagingSenderId: '868124630484',
    projectId: 'instantquote-997f3',
    databaseURL: 'https://instantquote-997f3-default-rtdb.firebaseio.com',
    storageBucket: 'instantquote-997f3.appspot.com',
    iosBundleId: 'com.example.instantQuote.RunnerTests',
  );
}
