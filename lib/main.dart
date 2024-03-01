import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:park_app/screens/auth.dart';
import 'firebase_options.dart';
//import 'package:park_app/profile_page.dart';
//import 'package:park_app/side_bar.dart';
//import 'package:park_app/screens/bottom_nagivation_bar.dart';
//import 'package:park_app/profile_page.dart';
//import 'package:park_app/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';

final theme1 = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 17, 62, 244),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      theme: theme1,
      home: const AuthScreen(),
      debugShowCheckedModeBanner: false));
}
