/*import 'package:flutter/material.dart';

// Existing screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

// Translation screens
import 'screens/language_selection_screen.dart';
import 'screens/choose_output_option_screen.dart';
import 'screens/listening_screen.dart';
import 'screens/choose_output_screen.dart';
import 'screens/history_screen.dart';

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
      initialRoute: '/', // Start with splash screen
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),

        // Translation flow routes
        '/language_selection': (context) => const LanguageSelectionScreen(),

        // ListeningScreen requires arguments: fromLanguage, toLanguage
        '/listening': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ListeningScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
          );
        },

        // ChooseOutputOptionScreen after language selection
        '/choose_option': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ChooseOutputOptionScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
          );
        },

        '/translation': (context) => const ChooseOutputScreen(),

        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

// Existing screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

// Translation screens
import 'screens/language_selection_screen.dart';
import 'screens/choose_output_mode.dart';
import 'screens/listening_screen.dart';
import 'screens/choose_output.dart';
import 'screens/history_screen.dart';

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
      initialRoute: '/', // Start with splash screen
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),

        // Translation flow routes
        '/language_selection': (context) => const LanguageSelectionScreen(),

        // ListeningScreen requires arguments: fromLanguage, toLanguage
        '/listening': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ListeningScreen(fromLanguage: fromLang, toLanguage: toLang);
        },

        // ChooseOutputModeScreen after language selection
        '/choose_option': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ChooseOutputModeScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
          );
        },

        // Translation output screen
        '/translation': (context) => const ChooseOutputScreen(),

        // History screen
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:travoca_app/screens/choose_output_mode.dart';

// Existing screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

// Translation screens
import 'screens/language_selection_screen.dart';
import 'screens/choose_output_mode.dart'; // Updated name
import 'screens/listening_screen.dart';
import 'screens/choose_output.dart';
import 'screens/history_screen.dart';

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
      initialRoute: '/', // Start with splash screen
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),

        // Language Selection
        '/language_selection': (context) => const LanguageSelectionScreen(),

        // Choose Output Mode
        '/choose_option': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ChooseOutputModeScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
          );
        },

        // Listening Screen
        '/listening': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ListeningScreen(fromLanguage: fromLang, toLanguage: toLang);
        },

        // Translation Output Screen
        '/translation': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';
          String recognizedText = args?['recognizedText'] ?? '';

          return ChooseOutputScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
            recognizedText: recognizedText,
          );
        },

        // History Screen
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

// Existing screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

// Translation screens
import 'screens/language_selection_screen.dart';
import 'screens/choose_output_mode.dart';
import 'screens/listening_screen.dart';
import 'screens/choose_output.dart';
import 'screens/history_screen.dart';

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
      initialRoute: '/', // Start with splash screen
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),

        // Language selection screen
        '/language_selection': (context) => const LanguageSelectionScreen(),

        // Choose output mode screen after language selection
        '/choose_option': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ChooseOutputModeScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
          );
        },

        // Listening screen (voice capture)
        '/listening': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ListeningScreen(fromLanguage: fromLang, toLanguage: toLang);
        },

        // Output screen (text / voice)
        '/translation': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';
          String recognizedText = args?['recognizedText'] ?? '';

          return ChooseOutputScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
            recognizedText: recognizedText,
          );
        },

        // History screen
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
*/
import 'package:flutter/material.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/language_selection_screen.dart';
import 'screens/choose_output_mode.dart';
import 'screens/listening_screen.dart';
import 'screens/choose_output.dart';
import 'screens/history_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/language_selection': (context) => const LanguageSelectionScreen(),

        // Choose Output Mode after language selection
        '/choose_output_mode': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ChooseOutputModeScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
          );
        },

        // Listening Screen
        '/listening': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';

          return ListeningScreen(fromLanguage: fromLang, toLanguage: toLang);
        },

        // Choose Output Screen (after speech is recognized)
        '/choose_output': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>?;
          String fromLang = args?['fromLanguage'] ?? 'English';
          String toLang = args?['toLanguage'] ?? 'Hindi';
          String recognizedText = args?['recognizedText'] ?? '';

          return ChooseOutputScreen(
            fromLanguage: fromLang,
            toLanguage: toLang,
            recognizedText: recognizedText,
          );
        },

        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
