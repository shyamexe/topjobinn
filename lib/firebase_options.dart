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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAe-wcmsu_bLafjt0VbbX0XCJWGE12o6wg',
    appId: '1:466802588240:android:fcc21dad33a855c631af55',
    messagingSenderId: '466802588240',
    projectId: 'bloc-login-11bb7',
    storageBucket: 'bloc-login-11bb7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBk47049kUlemDqBSnWnGsnbQg8aXd_sow',
    appId: '1:466802588240:ios:f754f1c16f8c393c31af55',
    messagingSenderId: '466802588240',
    projectId: 'bloc-login-11bb7',
    storageBucket: 'bloc-login-11bb7.appspot.com',
    androidClientId: '466802588240-pm45pjtf0sqjuggssevibt8dedjo7g9r.apps.googleusercontent.com',
    iosClientId: '466802588240-2vr7lvbraeenme1stfcvmapcgh25i138.apps.googleusercontent.com',
    iosBundleId: 'com.example.topjobinn',
  );
}
