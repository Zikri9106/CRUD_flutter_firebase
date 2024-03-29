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
    apiKey: 'AIzaSyDoYBC9jqBOaP6qy5RibT4fmnG4w95SH9A',
    appId: '1:29856039213:web:84c8d8cbbabdc4be28d3a4',
    messagingSenderId: '29856039213',
    projectId: 'crudfirebase-e7c23',
    authDomain: 'crudfirebase-e7c23.firebaseapp.com',
    storageBucket: 'crudfirebase-e7c23.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-MQ95MA7VmpRnIjGqCJHRaSYmPBiGZ9g',
    appId: '1:29856039213:android:b461dcd7f8fa9c2928d3a4',
    messagingSenderId: '29856039213',
    projectId: 'crudfirebase-e7c23',
    storageBucket: 'crudfirebase-e7c23.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDm9YnbQD7d6dqzMzfYgt8Xw-wB6OKTUl4',
    appId: '1:29856039213:ios:6569f16d7c51338328d3a4',
    messagingSenderId: '29856039213',
    projectId: 'crudfirebase-e7c23',
    storageBucket: 'crudfirebase-e7c23.appspot.com',
    iosBundleId: 'com.example.crudflutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDm9YnbQD7d6dqzMzfYgt8Xw-wB6OKTUl4',
    appId: '1:29856039213:ios:11ec3057a1c2354328d3a4',
    messagingSenderId: '29856039213',
    projectId: 'crudfirebase-e7c23',
    storageBucket: 'crudfirebase-e7c23.appspot.com',
    iosBundleId: 'com.example.crudflutter.RunnerTests',
  );
}
