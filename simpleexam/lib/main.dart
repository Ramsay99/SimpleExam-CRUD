import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screen/create_user.dart';

/// Applying Johannes Milke CRUD example from YouTube,
/// URL: https://www.youtube.com/watch?v=ErP_xomHKTw&ab_channel=JohannesMilke
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateUser(),
    );
  }
}
