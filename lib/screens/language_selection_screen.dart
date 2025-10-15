/*import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  const LanguageSelectionScreen({super.key});
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
  ];

  void swapLanguages() {
    setState(() {
      final temp = fromLanguage;
      fromLanguage = toLanguage;
      toLanguage = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A), // Dark blue background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "CHOOSE LANGUAGE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // From Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                hint: const Text(
                  "From",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: fromLanguage,
                items:
                    languages
                        .map(
                          (lang) =>
                              DropdownMenuItem(value: lang, child: Text(lang)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() => fromLanguage = value);
                },
              ),

              const SizedBox(height: 20),

              // Swap Button
              GestureDetector(
                onTap: swapLanguages,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 24,
                  child: const Icon(Icons.swap_vert, color: Colors.black),
                ),
              ),

              const SizedBox(height: 20),

              // To Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                hint: const Text(
                  "To",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: toLanguage,
                items:
                    languages
                        .map(
                          (lang) =>
                              DropdownMenuItem(value: lang, child: Text(lang)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() => toLanguage = value);
                },
              ),

              const SizedBox(height: 40),

              // Start Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    // Add navigation or action
                  },
                  child: const Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/ /*
import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
  ];

  void swapLanguages() {
    setState(() {
      final temp = fromLanguage;
      fromLanguage = toLanguage;
      toLanguage = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF233D9B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App logo or header
              Image.asset("assets/images/logo.png", height: height * 0.12),
              const SizedBox(height: 20),

              const Text(
                "Choose Your Languages",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 40),

              // From Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "From",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: Colors.white,
                value: fromLanguage,
                items:
                    languages
                        .map(
                          (lang) =>
                              DropdownMenuItem(value: lang, child: Text(lang)),
                        )
                        .toList(),
                onChanged: (value) => setState(() => fromLanguage = value),
              ),

              const SizedBox(height: 25),

              // Swap Button
              GestureDetector(
                onTap: swapLanguages,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.swap_vert,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // To Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "To",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: Colors.white,
                value: toLanguage,
                items:
                    languages
                        .map(
                          (lang) =>
                              DropdownMenuItem(value: lang, child: Text(lang)),
                        )
                        .toList(),
                onChanged: (value) => setState(() => toLanguage = value),
              ),

              const SizedBox(height: 40),

              // Start Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Navigate to next screen
                  },
                  child: const Text(
                    "Start",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Help icon
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.help_outline, color: Colors.black),
                    onPressed: () {
                      // TODO: Help action
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Hindi',
    'Telugu', // Telangana regional language
    'Urdu', // Telangana regional language
    'Tamil',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Bengali',
    'Gujarati',
    'Punjabi',
    'Oriya',
    'Spanish',
    'French',
    'German',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose Your Languages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // FROM Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'From',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: fromLanguage,
                  items:
                      languages
                          .map(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(lang),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      fromLanguage = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Swap button
                IconButton(
                  icon: const Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      final temp = fromLanguage;
                      fromLanguage = toLanguage;
                      toLanguage = temp;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // TO Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'To',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: toLanguage,
                  items:
                      languages
                          .map(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(lang),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      toLanguage = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Start Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Start translation action
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Start', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'listening_screen.dart'; // Make sure this exists

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Hindi',
    'Telugu', // Telangana regional language
    'Urdu', // Telangana regional language
    'Tamil',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Bengali',
    'Gujarati',
    'Punjabi',
    'Oriya',
    'Spanish',
    'French',
    'German',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1), // Same as previous screens
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose Your Languages',
                  style: TextStyle(
                    fontFamily: 'Poppins', // Same font as previous screens
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // FROM Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'From',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: fromLanguage,
                  items:
                      languages
                          .map(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(
                                lang,
                                style: const TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      fromLanguage = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Swap button
                IconButton(
                  icon: const Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      final temp = fromLanguage;
                      fromLanguage = toLanguage;
                      toLanguage = temp;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // TO Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'To',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: toLanguage,
                  items:
                      languages
                          .map(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(
                                lang,
                                style: const TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      toLanguage = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Start Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (fromLanguage != null && toLanguage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ListeningScreen(
                                  fromLanguage: fromLanguage!,
                                  toLanguage: toLanguage!,
                                ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select both languages first'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // optional
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
*/ /*
import 'package:flutter/material.dart';
import 'listening_screen.dart'; // Import your ListeningScreen

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Hindi',
    'Telugu', // Telangana regional language
    'Urdu',   // Telangana regional language
    'Tamil',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Bengali',
    'Gujarati',
    'Punjabi',
    'Oriya',
    'Spanish',
    'French',
    'German',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose Your Languages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // FROM Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'From',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: fromLanguage,
                  items: languages
                      .map(
                        (lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      fromLanguage = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Swap button
                IconButton(
                  icon: const Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      final temp = fromLanguage;
                      fromLanguage = toLanguage;
                      toLanguage = temp;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // TO Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'To',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: toLanguage,
                  items: languages
                      .map(
                        (lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      toLanguage = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Start Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (fromLanguage != null && toLanguage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListeningScreen(
                              fromLanguage: fromLanguage!,
                              toLanguage: toLanguage!,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please select both languages first',
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Start', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'listening_screen.dart'; // Import your ListeningScreen

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Hindi',
    'Telugu', // Telangana regional language
    'Urdu', // Telangana regional language
    'Tamil',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Bengali',
    'Gujarati',
    'Punjabi',
    'Oriya',
    'Spanish',
    'French',
    'German',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CHOOSE YOUR LANGUAGES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // FROM Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'From',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: fromLanguage,
                  items:
                      languages
                          .map(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(lang),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      fromLanguage = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Swap button
                IconButton(
                  icon: const Icon(
                    Icons.swap_vert,
                    color: Color.fromARGB(255, 13, 4, 4),
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      final temp = fromLanguage;
                      fromLanguage = toLanguage;
                      toLanguage = temp;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // TO Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'To',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: toLanguage,
                  items:
                      languages
                          .map(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(lang),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      toLanguage = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Start Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (fromLanguage != null && toLanguage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ListeningScreen(
                                  fromLanguage: fromLanguage!,
                                  toLanguage: toLanguage!,
                                ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select both languages first'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Start', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'listening_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English', 'Hindi', 'Telugu', 'Urdu', 'Tamil', 'Kannada', 'Malayalam',
    'Marathi', 'Bengali', 'Gujarati', 'Punjabi', 'Oriya', 'Spanish', 'French',
    'German', 'Italian', 'Japanese', 'Korean', 'Chinese (Simplified)',
    'Chinese (Traditional)', 'Arabic', 'Russian', 'Portuguese', 'Dutch',
    'Turkish', 'Greek', 'Swedish', 'Norwegian', 'Polish', 'Finnish',
    'Vietnamese', 'Thai', 'Indonesian', 'Hebrew', 'Czech', 'Romanian',
    'Ukrainian', 'Afrikaans', 'Bulgarian', 'Croatian', 'Slovak', 'Serbian'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CHOOSE YOUR LANGUAGES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // FROM
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'From',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownSearch<String>(
                  items: languages,
                  selectedItem: fromLanguage,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Select source language',
                    ),
                  ),
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        labelText: 'Search language...',
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() => fromLanguage = value),
                ),

                const SizedBox(height: 20),

                // Swap
                IconButton(
                  icon: const Icon(Icons.swap_vert, color: Colors.white, size: 30),
                  onPressed: () {
                    setState(() {
                      final temp = fromLanguage;
                      fromLanguage = toLanguage;
                      toLanguage = temp;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // TO
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'To',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownSearch<String>(
                  items: languages,
                  selectedItem: toLanguage,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Select target language',
                    ),
                  ),
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        labelText: 'Search language...',
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() => toLanguage = value),
                ),

                const SizedBox(height: 30),

                // Start Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (fromLanguage != null && toLanguage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListeningScreen(
                              fromLanguage: fromLanguage!,
                              toLanguage: toLanguage!,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select both languages first'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
//adding more languages and dro[down seacrh for easy selection of language
/*
import 'package:flutter/material.dart';
import 'listening_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Hindi',
    'Telugu',
    'Urdu',
    'Tamil',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Bengali',
    'Gujarati',
    'Punjabi',
    //'Oriya',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Japanese',
    'Korean',
    'Chinese (Simplified)',
    'Chinese (Traditional)',
    'Arabic',
    'Russian',
    'Portuguese',
    'Dutch',
    'Turkish',
    'Greek',
    'Swedish',
    'Norwegian',
    'Polish',
    'Finnish',
    'Vietnamese',
    'Thai',
    'Indonesian',
    'Hebrew',
    'Czech',
    'Romanian',
    'Ukrainian',
    'Afrikaans',
    'Bulgarian',
    'Croatian',
    'Slovak',
    'Serbian',
  ];

  /// Shows a dialog that lets user search & pick a language.
  Future<String?> _showLanguagePicker(BuildContext context, String title) {
    String query = '';

    return showDialog<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final results =
                query.isEmpty
                    ? languages
                    : languages
                        .where(
                          (l) => l.toLowerCase().contains(
                            query.trim().toLowerCase(),
                          ),
                        )
                        .toList();

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(
                  // keep dialog reasonably sized on small/large screens
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search language...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (v) => setState(() => query = v),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child:
                          results.isEmpty
                              ? const Center(child: Text('No languages found'))
                              : ListView.separated(
                                itemCount: results.length,
                                separatorBuilder:
                                    (_, __) => const Divider(height: 0),
                                itemBuilder: (context, index) {
                                  final lang = results[index];
                                  return ListTile(
                                    title: Text(lang),
                                    onTap:
                                        () => Navigator.of(context).pop(lang),
                                  );
                                },
                              ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _languagePickerTile({
    required String label,
    required String? value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value ?? 'Select language',
                    style: TextStyle(
                      color: value == null ? Colors.grey[600] : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.black54),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'CHOOSE YOUR LANGUAGES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // FROM
                  _languagePickerTile(
                    label: 'From',
                    value: fromLanguage,
                    onTap: () async {
                      final selection = await _showLanguagePicker(
                        context,
                        'Select source',
                      );
                      if (selection != null) {
                        setState(() => fromLanguage = selection);
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  // Swap button
                  IconButton(
                    icon: const Icon(
                      Icons.swap_vert,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        final temp = fromLanguage;
                        fromLanguage = toLanguage;
                        toLanguage = temp;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // TO
                  _languagePickerTile(
                    label: 'To',
                    value: toLanguage,
                    onTap: () async {
                      final selection = await _showLanguagePicker(
                        context,
                        'Select target',
                      );
                      if (selection != null) {
                        setState(() => toLanguage = selection);
                      }
                    },
                  ),

                  const SizedBox(height: 30),

                  // Start Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (fromLanguage != null && toLanguage != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ListeningScreen(
                                    fromLanguage: fromLanguage!,
                                    toLanguage: toLanguage!,
                                  ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please select both languages first',
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*

//adding county flags with nice dropdown ui
import 'package:flutter/material.dart';
import 'listening_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Hindi',
    'Telugu',
    'Urdu',
    'Tamil',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Bengali',
    'Gujarati',
    'Punjabi',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Japanese',
    'Korean',
    'Chinese (Simplified)',
    'Chinese (Traditional)',
    'Arabic',
    'Russian',
    'Portuguese',
    'Dutch',
    'Turkish',
    'Greek',
    'Swedish',
    'Norwegian',
    'Polish',
    'Finnish',
    'Vietnamese',
    'Thai',
    'Indonesian',
    'Hebrew',
    'Czech',
    'Romanian',
    'Ukrainian',
    'Afrikaans',
    'Bulgarian',
    'Croatian',
    'Slovak',
    'Serbian',
  ];

  final Map<String, String> languageFlags = {
    'English': '🇬🇧',
    'Hindi': '🇮🇳',
    'Telugu': '🇮🇳',
    'Urdu': '🇮🇳',
    'Tamil': '🇮🇳',
    'Kannada': '🇮🇳',
    'Malayalam': '🇮🇳',
    'Bengali': '🇮🇳',
    'Gujarati': '🇮🇳',
    'Punjabi': '🇮🇳',
    'Spanish': '🇪🇸',
    'French': '🇫🇷',
    'German': '🇩🇪',
    'Italian': '🇮🇹',
    'Japanese': '🇯🇵',
    'Korean': '🇰🇷',
    'Chinese (Simplified)': '🇨🇳',
    'Chinese (Traditional)': '🇨🇳',
    'Arabic': '🇸🇦',
    'Russian': '🇷🇺',
    'Portuguese': '🇵🇹',
    'Dutch': '🇳🇱',
    'Turkish': '🇹🇷',
    'Greek': '🇬🇷',
    'Swedish': '🇸🇪',
    'Norwegian': '🇳🇴',
    'Polish': '🇵🇱',
    'Finnish': '🇫🇮',
    'Vietnamese': '🇻🇳',
    'Thai': '🇹🇭',
    'Indonesian': '🇮🇩',
    'Hebrew': '🇮🇱',
    'Czech': '🇨🇿',
    'Romanian': '🇷🇴',
    'Ukrainian': '🇺🇦',
    'Afrikaans': '🇿🇦',
    'Bulgarian': '🇧🇬',
    'Croatian': '🇭🇷',
    'Slovak': '🇸🇰',
    'Serbian': '🇷🇸',
  };

  Future<String?> _showLanguagePicker(BuildContext context, String title) {
    String query = '';

    return showDialog<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final results =
                query.isEmpty
                    ? languages
                    : languages
                        .where(
                          (l) => l.toLowerCase().contains(
                            query.trim().toLowerCase(),
                          ),
                        )
                        .toList();

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3A8A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search language...',
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF2E4AA7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (v) => setState(() => query = v),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child:
                          results.isEmpty
                              ? const Center(
                                child: Text(
                                  'No languages found',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                              : ListView.separated(
                                itemCount: results.length,
                                separatorBuilder:
                                    (_, __) => const Divider(
                                      height: 0,
                                      color: Colors.white24,
                                    ),
                                itemBuilder: (context, index) {
                                  final lang = results[index];
                                  return ListTile(
                                    leading: Text(
                                      languageFlags[lang] ?? '🌐',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    title: Text(
                                      lang,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap:
                                        () => Navigator.of(context).pop(lang),
                                  );
                                },
                              ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _languagePickerTile({
    required String label,
    required String? value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF2E4AA7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value ?? 'Select language',
                    style: TextStyle(
                      color: value == null ? Colors.white70 : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'CHOOSE YOUR LANGUAGES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // FROM
                  _languagePickerTile(
                    label: 'From',
                    value: fromLanguage,
                    onTap: () async {
                      final selection = await _showLanguagePicker(
                        context,
                        'Select source',
                      );
                      if (selection != null)
                        setState(() => fromLanguage = selection);
                    },
                  ),

                  const SizedBox(height: 20),

                  // Swap button
                  IconButton(
                    icon: const Icon(
                      Icons.swap_vert,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        final temp = fromLanguage;
                        fromLanguage = toLanguage;
                        toLanguage = temp;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // TO
                  _languagePickerTile(
                    label: 'To',
                    value: toLanguage,
                    onTap: () async {
                      final selection = await _showLanguagePicker(
                        context,
                        'Select target',
                      );
                      if (selection != null)
                        setState(() => toLanguage = selection);
                    },
                  ),

                  const SizedBox(height: 30),

                  // Start Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (fromLanguage != null && toLanguage != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ListeningScreen(
                                    fromLanguage: fromLanguage!,
                                    toLanguage: toLanguage!,
                                  ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please select both languages first',
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/

//adding help button ,clear button
import 'package:flutter/material.dart';
import 'listening_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? fromLanguage;
  String? toLanguage;

  final List<String> languages = [
    'English',
    'Hindi',
    'Telugu',
    'Urdu',
    'Tamil',
    'Kannada',
    'Malayalam',
    'Bengali',
    'Gujarati',
    'Punjabi',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Japanese',
    'Korean',
    'Chinese (Simplified)',
    'Chinese (Traditional)',
    'Arabic',
    'Russian',
    'Portuguese',
    'Dutch',
    'Turkish',
    'Greek',
    'Swedish',
    'Norwegian',
    'Polish',
    'Finnish',
    'Vietnamese',
    'Thai',
    'Indonesian',
    'Hebrew',
    'Czech',
    'Romanian',
    'Ukrainian',
    'Afrikaans',
    'Bulgarian',
    'Croatian',
    'Slovak',
    'Serbian',
  ];

  final Map<String, String> languageFlags = {
    'English': '🇬🇧',
    'Hindi': '🇮🇳',
    'Telugu': '🇮🇳',
    'Urdu': '🇮🇳',
    'Tamil': '🇮🇳',
    'Kannada': '🇮🇳',
    'Malayalam': '🇮🇳',
    'Bengali': '🇮🇳',
    'Gujarati': '🇮🇳',
    'Punjabi': '🇮🇳',
    'Spanish': '🇪🇸',
    'French': '🇫🇷',
    'German': '🇩🇪',
    'Italian': '🇮🇹',
    'Japanese': '🇯🇵',
    'Korean': '🇰🇷',
    'Chinese (Simplified)': '🇨🇳',
    'Chinese (Traditional)': '🇨🇳',
    'Arabic': '🇸🇦',
    'Russian': '🇷🇺',
    'Portuguese': '🇵🇹',
    'Dutch': '🇳🇱',
    'Turkish': '🇹🇷',
    'Greek': '🇬🇷',
    'Swedish': '🇸🇪',
    'Norwegian': '🇳🇴',
    'Polish': '🇵🇱',
    'Finnish': '🇫🇮',
    'Vietnamese': '🇻🇳',
    'Thai': '🇹🇭',
    'Indonesian': '🇮🇩',
    'Hebrew': '🇮🇱',
    'Czech': '🇨🇿',
    'Romanian': '🇷🇴',
    'Ukrainian': '🇺🇦',
    'Afrikaans': '🇿🇦',
    'Bulgarian': '🇧🇬',
    'Croatian': '🇭🇷',
    'Slovak': '🇸🇰',
    'Serbian': '🇷🇸',
  };

  Future<String?> _showLanguagePicker(BuildContext context, String title) {
    String query = '';
    return showDialog<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final results =
                query.isEmpty
                    ? languages
                    : languages
                        .where(
                          (l) => l.toLowerCase().contains(
                            query.trim().toLowerCase(),
                          ),
                        )
                        .toList();

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3A8A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search language...',
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF2E4AA7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (v) => setState(() => query = v),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child:
                          results.isEmpty
                              ? const Center(
                                child: Text(
                                  'No languages found',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                              : ListView.separated(
                                itemCount: results.length,
                                separatorBuilder:
                                    (_, __) => const Divider(
                                      height: 0,
                                      color: Colors.white24,
                                    ),
                                itemBuilder: (context, index) {
                                  final lang = results[index];
                                  return ListTile(
                                    leading: Text(
                                      languageFlags[lang] ?? '🌐',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    title: Text(
                                      lang,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap:
                                        () => Navigator.of(context).pop(lang),
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _languagePickerTile({
    required String label,
    required String? value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF2E4AA7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value ?? 'Select language',
                    style: TextStyle(
                      color: value == null ? Colors.white70 : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Main centered content
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'CHOOSE YOUR LANGUAGES',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          _languagePickerTile(
                            label: 'From',
                            value: fromLanguage,
                            onTap: () async {
                              final selection = await _showLanguagePicker(
                                context,
                                'Select source',
                              );
                              if (selection != null)
                                setState(() => fromLanguage = selection);
                            },
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                final temp = fromLanguage;
                                fromLanguage = toLanguage;
                                toLanguage = temp;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Icon(
                                Icons.swap_vert,
                                color: Colors.blueAccent,
                                size: 28,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _languagePickerTile(
                            label: 'To',
                            value: toLanguage,
                            onTap: () async {
                              final selection = await _showLanguagePicker(
                                context,
                                'Select target',
                              );
                              if (selection != null)
                                setState(() => toLanguage = selection);
                            },
                          ),
                          const SizedBox(height: 30),
                          // Start button centered below To
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (fromLanguage != null &&
                                    toLanguage != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ListeningScreen(
                                            fromLanguage: fromLanguage!,
                                            toLanguage: toLanguage!,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please select both languages first',
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ), // leave space for bottom buttons
                        ],
                      ),
                    ),
                  ),
                ),
                // Bottom row: Clear (left) + Help (right)
                Positioned(
                  bottom: 20,
                  left: 24,
                  right: 24,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              fromLanguage = null;
                              toLanguage = null;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Clear',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (_) => AlertDialog(
                                  title: const Text('Help & FAQs'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Q1: How do I select a language?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Tap on the "From" or "To" box to select a language from the list.',
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Q2: How do I search for a language?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Use the search bar in the dialog to quickly find your language.',
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Q3: What does the swap button do?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'It exchanges the selected "From" and "To" languages.',
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Q4: How do I clear my selections?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Tap the "Clear" button at bottom-left.',
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.help_outline,
                          color: Colors.blueAccent,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
