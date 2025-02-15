import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_generator/core/const/constants.dart';
import 'package:password_generator/features/generate_password/presentation/Pages/password%20_generate_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Generator',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme:
              GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white)),
      home: const PasswordGeneratePage(),
    );
  }
}
