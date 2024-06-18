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

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqDUhtEwKa9uMiijLIgVevRLjr1_3AY1w',
    appId: '1:955298170402:ios:d3b6cf17af00336739ec7b',
    messagingSenderId: '955298170402',
    projectId: 'fir-notes-c5497',
    storageBucket: 'fir-notes-c5497.appspot.com',
    iosBundleId: 'com.example.firebasenotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqDUhtEwKa9uMiijLIgVevRLjr1_3AY1w',
    appId: '1:955298170402:ios:d3b6cf17af00336739ec7b',
    messagingSenderId: '955298170402',
    projectId: 'fir-notes-c5497',
    storageBucket: 'fir-notes-c5497.appspot.com',
    iosBundleId: 'com.example.firebasenotes',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDJ45YghCTZxzbcvrhTWXJuE9fc9ITTm_M',
    appId: '1:955298170402:web:834cf9239348295939ec7b',
    messagingSenderId: '955298170402',
    projectId: 'fir-notes-c5497',
    authDomain: 'fir-notes-c5497.firebaseapp.com',
    storageBucket: 'fir-notes-c5497.appspot.com',
    measurementId: 'G-97TNBSR1GL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCNITuVeR8kvZniduNxFijQvMoOhcvnzg',
    appId: '1:955298170402:android:196d532bfb80e7f739ec7b',
    messagingSenderId: '955298170402',
    projectId: 'fir-notes-c5497',
    storageBucket: 'fir-notes-c5497.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDJ45YghCTZxzbcvrhTWXJuE9fc9ITTm_M',
    appId: '1:955298170402:web:ae013af665683fbd39ec7b',
    messagingSenderId: '955298170402',
    projectId: 'fir-notes-c5497',
    authDomain: 'fir-notes-c5497.firebaseapp.com',
    storageBucket: 'fir-notes-c5497.appspot.com',
    measurementId: 'G-CV3D9SPNTZ',
  );

}
