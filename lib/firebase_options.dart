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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBcGQjQaMjTLhQCHkoQjTL-LyJ4T8MdWwc',
    appId: '1:802699056435:web:6cbb0680cf361509c85a46',
    messagingSenderId: '802699056435',
    projectId: 'gym-app-dcdcf',
    authDomain: 'gym-app-dcdcf.firebaseapp.com',
    storageBucket: 'gym-app-dcdcf.firebasestorage.app',
    measurementId: 'G-BCBSH08ZMF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx1C-LgSNt9nqXIZMzD-LN2WXtqA-3AVI',
    appId: '1:802699056435:android:f25c2e5cacb67efdc85a46',
    messagingSenderId: '802699056435',
    projectId: 'gym-app-dcdcf',
    storageBucket: 'gym-app-dcdcf.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0J5llr0PbWRazTEvrfqfTGuDADSZZy1U',
    appId: '1:802699056435:ios:51a2b3cc465e6e47c85a46',
    messagingSenderId: '802699056435',
    projectId: 'gym-app-dcdcf',
    storageBucket: 'gym-app-dcdcf.firebasestorage.app',
    iosBundleId: 'com.example.gymApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0J5llr0PbWRazTEvrfqfTGuDADSZZy1U',
    appId: '1:802699056435:ios:51a2b3cc465e6e47c85a46',
    messagingSenderId: '802699056435',
    projectId: 'gym-app-dcdcf',
    storageBucket: 'gym-app-dcdcf.firebasestorage.app',
    iosBundleId: 'com.example.gymApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBcGQjQaMjTLhQCHkoQjTL-LyJ4T8MdWwc',
    appId: '1:802699056435:web:722d6ed805fe0645c85a46',
    messagingSenderId: '802699056435',
    projectId: 'gym-app-dcdcf',
    authDomain: 'gym-app-dcdcf.firebaseapp.com',
    storageBucket: 'gym-app-dcdcf.firebasestorage.app',
    measurementId: 'G-1KPKVBFYFS',
  );

}