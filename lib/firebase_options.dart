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
    apiKey: 'AIzaSyClvyaDPAQHZRz7FyqAqrJ4HUtD8NJBU7w',
    appId: '1:464095907484:web:e99267b7c2370423112759',
    messagingSenderId: '464095907484',
    projectId: 'causecompass-a9776',
    authDomain: 'causecompass-a9776.firebaseapp.com',
    storageBucket: 'causecompass-a9776.appspot.com',
    measurementId: 'G-B3RS8LJ84E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBX267M77mZOU63UvX3_fpoLOD1_3cSZaE',
    appId: '1:464095907484:android:d37285a852f91224112759',
    messagingSenderId: '464095907484',
    projectId: 'causecompass-a9776',
    storageBucket: 'causecompass-a9776.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlEQn1K91oJcZBzshQC9D57pGMXs3fFOE',
    appId: '1:464095907484:ios:61f3e7b559f2c86d112759',
    messagingSenderId: '464095907484',
    projectId: 'causecompass-a9776',
    storageBucket: 'causecompass-a9776.appspot.com',
    iosBundleId: 'com.example.causecompass',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlEQn1K91oJcZBzshQC9D57pGMXs3fFOE',
    appId: '1:464095907484:ios:8a6d19ff0871f27a112759',
    messagingSenderId: '464095907484',
    projectId: 'causecompass-a9776',
    storageBucket: 'causecompass-a9776.appspot.com',
    iosBundleId: 'com.example.causecompass.RunnerTests',
  );
}
