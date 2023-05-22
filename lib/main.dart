import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ig_clone1/responsive/layout_screen.dart';
import 'package:ig_clone1/responsive/mobile_screen_layout.dart';
import 'package:ig_clone1/responsive/web_screen_layout.dart';
import 'package:ig_clone1/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyDlbVYpjtLIccMu61fkx7fZYOsi5outSyM",
      appId: "1:626587933473:web:c68efd9fb2e7ae4993bc60",
      messagingSenderId: "626587933473",
      projectId: "day1-img",
      storageBucket: "day1-img.appspot.com",
    ));
  } else {
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: const LayoutScreen(
            webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout()));
  }
}
