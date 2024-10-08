// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDQTnuQCKqjng7_UGL-RPSLTo-gX1oaa9w',
    appId: '1:913280393012:web:c40ef83b7f3ce9a7c5cf61',
    messagingSenderId: '913280393012',
    projectId: 'ecommerceapp-ae33f',
    authDomain: 'ecommerceapp-ae33f.firebaseapp.com',
    storageBucket: 'ecommerceapp-ae33f.appspot.com',
    measurementId: 'G-M6QDPDXJNB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmHu6QF4N0ZqKnxexO8U-o64aXDX2B97I',
    appId: '1:913280393012:android:ec6197d646c56426c5cf61',
    messagingSenderId: '913280393012',
    projectId: 'ecommerceapp-ae33f',
    storageBucket: 'ecommerceapp-ae33f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVzrhqcIfeiVEhKCh2tkGgLCvLThHjEJQ',
    appId: '1:913280393012:ios:bd983b312e89f1d0c5cf61',
    messagingSenderId: '913280393012',
    projectId: 'ecommerceapp-ae33f',
    storageBucket: 'ecommerceapp-ae33f.appspot.com',
    androidClientId: '913280393012-ae24bs4v20mo8bfgppuu2t4ve32kjena.apps.googleusercontent.com',
    iosClientId: '913280393012-vmgpfvq3rt9l0e8ohapupjbqeetlj8o4.apps.googleusercontent.com',
    iosBundleId: 'com.example.eeCommerceApp',
  );
}
