import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internship_finder/providers/auth_provider.dart';
import 'package:internship_finder/views/login_page.dart';
import 'package:internship_finder/views/main_navigation_page.dart';

import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthController>();

    return StreamBuilder<User?>(
      stream: authProvider.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Auth error: ${snapshot.error}')),
          );
        }

        final user = snapshot.data;

        if (user != null) {
          debugPrint('AuthGate: Opening MainNavigationPage');

          return MainNavigationPage();
        }

        return const LoginPage();
      },
    );
  }
}
