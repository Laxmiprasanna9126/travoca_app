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
