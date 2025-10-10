import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

// Import new translation screens
import 'screens/language_selection_screen.dart';
import 'screens/listening_screen.dart';
import 'screens/translation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travoca App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Start with splash
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),

        // Voice Translation Routes
        '/language_selection': (context) => LanguageSelectionScreen(),

        '/listening':
            (context) => ListeningScreen(
              fromLanguage:
                  ModalRoute.of(context)!.settings.arguments as String? ??
                  'English',
              toLanguage:
                  ModalRoute.of(context)!.settings.arguments as String? ??
                  'Hindi',
            ),

        '/translation': (context) => TranslationScreen(),
      },
    );
  }
}

/*
import 'package:flutter/material.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart'; // Add AuthScreen
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/language_selection_screen.dart';
import 'screens/listening_screen.dart';
import 'screens/translation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travoca App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Start with splash
      routes: {
        '/': (context) => const SplashScreen(), // Splash Screen
        '/auth':
            (context) =>
                const AuthScreen(), // Auth Screen for Sign In / Sign Up
        '/login': (context) => const LoginScreen(), // Login Screen
        '/signup': (context) => const SignUpScreen(), // Signup Screen
        '/language_selection': (context) => const LanguageSelectionScreen(),
        '/listening': (context) => const ListeningScreen(),
        '/translation': (context) => const TranslationScreen(),
      },
    );
  }
}
*/
