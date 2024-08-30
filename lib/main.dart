

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage

  // Todo: Init Payment Methods

  // Todo: Await Native Splash

  // Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // .then((FirebaseApp value) => Get.put(AuthenticationRepository()))

  // Todo: Initialize Authentication

  // Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
