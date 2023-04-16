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
    apiKey: 'AIzaSyDqclHl2OlxdBbdwbQWTldrp1Sr8Ndgdyg',
    appId: '1:483268599973:web:c34fcd56afcac3452aed4c',
    messagingSenderId: '483268599973',
    projectId: 'letmegrab-f16f3',
    authDomain: 'letmegrab-f16f3.firebaseapp.com',
    storageBucket: 'letmegrab-f16f3.appspot.com',
    measurementId: 'G-8RVF417XKE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNO2AtSaVAmh-ZQUPK5mB53eM-yTv9zFY',
    appId: '1:483268599973:android:7f247a48015b933c2aed4c',
    messagingSenderId: '483268599973',
    projectId: 'letmegrab-f16f3',
    storageBucket: 'letmegrab-f16f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2WShE1oh4bxh6a5CdpU8MJ0uasFycVw4',
    appId: '1:483268599973:ios:a1da003854116c2e2aed4c',
    messagingSenderId: '483268599973',
    projectId: 'letmegrab-f16f3',
    storageBucket: 'letmegrab-f16f3.appspot.com',
    androidClientId: '483268599973-9gv8ernu6e3q648v07338v9753meti97.apps.googleusercontent.com',
    iosClientId: '483268599973-3pe25remnarsbfghftsa2b3dnh39e55c.apps.googleusercontent.com',
    iosBundleId: 'com.example.letmegrab',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2WShE1oh4bxh6a5CdpU8MJ0uasFycVw4',
    appId: '1:483268599973:ios:a1da003854116c2e2aed4c',
    messagingSenderId: '483268599973',
    projectId: 'letmegrab-f16f3',
    storageBucket: 'letmegrab-f16f3.appspot.com',
    androidClientId: '483268599973-9gv8ernu6e3q648v07338v9753meti97.apps.googleusercontent.com',
    iosClientId: '483268599973-3pe25remnarsbfghftsa2b3dnh39e55c.apps.googleusercontent.com',
    iosBundleId: 'com.example.letmegrab',
  );
}
