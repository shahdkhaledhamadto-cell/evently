// File generated for the evently-shahd Firebase project.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Firebase has not been configured for Web.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      case TargetPlatform.iOS:
        throw UnsupportedError(
          'Firebase has not been configured for iOS.',
        );

      case TargetPlatform.macOS:
        throw UnsupportedError(
          'Firebase has not been configured for macOS.',
        );

      case TargetPlatform.windows:
        throw UnsupportedError(
          'Firebase has not been configured for Windows.',
        );

      case TargetPlatform.linux:
        throw UnsupportedError(
          'Firebase has not been configured for Linux.',
        );

      default:
        throw UnsupportedError(
          'Firebase is not supported on this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDw4CseO-2E6ZqxOxYy_4eBnmCTrvgzMwg',
    appId: '1:468704356475:android:6b7ef678edd87787d41ade',
    messagingSenderId: '468704356475',
    projectId: 'evently-shahd',
    storageBucket: 'evently-shahd.firebasestorage.app',
  );
}