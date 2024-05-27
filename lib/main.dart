import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white, fontSize: 24 ),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 20)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.black),
        // fontFamily: GoogleFonts.ptSans().fontFamily,
        useMaterial3: true,
        
      ),
      home: const SplashScreen()
    );
  }
}
