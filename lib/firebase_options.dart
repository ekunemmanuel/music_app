// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        return windows;
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

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyDnqScpFiboIa4lQPSIK8tb-X9ZKFhljcw',
  //   appId: '1:463443100868:web:494406aa9338bfde713591',
  //   messagingSenderId: '463443100868',
  //   projectId: 'music-app-e7fcf',
  //   authDomain: 'music-app-e7fcf.firebaseapp.com',
  //   storageBucket: 'music-app-e7fcf.appspot.com',
  //   measurementId: 'G-TQ4XZESXL2',
  // );

  // static const FirebaseOptions android = FirebaseOptions(
  //   apiKey: 'AIzaSyC-jUrqcvS5Zq3zRYDSSXnqaCzAM2syAiI',
  //   appId: '1:463443100868:android:50802505e182a0b1713591',
  //   messagingSenderId: '463443100868',
  //   projectId: 'music-app-e7fcf',
  //   storageBucket: 'music-app-e7fcf.appspot.com',
  // );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyAhhPQZsassFWbJKj8SBD2sMyyowQXzUAw',
  //   appId: '1:463443100868:ios:f46b8c58f781dae6713591',
  //   messagingSenderId: '463443100868',
  //   projectId: 'music-app-e7fcf',
  //   storageBucket: 'music-app-e7fcf.appspot.com',
  //   iosBundleId: 'com.example.musicApp',
  // );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyAhhPQZsassFWbJKj8SBD2sMyyowQXzUAw',
  //   appId: '1:463443100868:ios:f46b8c58f781dae6713591',
  //   messagingSenderId: '463443100868',
  //   projectId: 'music-app-e7fcf',
  //   storageBucket: 'music-app-e7fcf.appspot.com',
  //   iosBundleId: 'com.example.musicApp',
  // );

  // static const FirebaseOptions windows = FirebaseOptions(
  //   apiKey: 'AIzaSyDnqScpFiboIa4lQPSIK8tb-X9ZKFhljcw',
  //   appId: '1:463443100868:web:23420abab01c75a9713591',
  //   messagingSenderId: '463443100868',
  //   projectId: 'music-app-e7fcf',
  //   authDomain: 'music-app-e7fcf.firebaseapp.com',
  //   storageBucket: 'music-app-e7fcf.appspot.com',
  //   measurementId: 'G-G6GZ1G3FM3',
  // );

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_WEB']!,
    appId: dotenv.env['FIREBASE_APP_ID_WEB']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID_WEB']!,
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_ANDROID']!,
    appId: dotenv.env['FIREBASE_APP_ID_ANDROID']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_IOS']!,
    appId: dotenv.env['FIREBASE_APP_ID_IOS']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
  );

  static final FirebaseOptions macos = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_IOS']!,
    appId: dotenv.env['FIREBASE_APP_ID_MACOS']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
  );

  static final FirebaseOptions windows = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_WEB']!,
    appId: dotenv.env['FIREBASE_APP_ID_WINDOWS']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID_WINDOWS']!,
  );
}
