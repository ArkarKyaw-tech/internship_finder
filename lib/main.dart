import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship_finder/firebase_options.dart';
import 'package:internship_finder/providers/auth_provider.dart';
import 'package:internship_finder/views/auth_gate.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthController(),
      child: const InternshipFinder(),
    ),
  );
}

class InternshipFinder extends StatelessWidget {
  const InternshipFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internship Finder',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3549E8)),
        fontFamily: 'English',
      ),

      home: AuthGate(),
    );
  }
}
