/*import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // for text-to-speech
import 'package:translator/translator.dart'; // for translation

class ChooseOutputScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String recognizedText;

  const ChooseOutputScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.recognizedText,
  });

  @override
  State<ChooseOutputScreen> createState() => _ChooseOutputScreenState();
}

class _ChooseOutputScreenState extends State<ChooseOutputScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  String? _translatedText;

  Future<void> _translateText() async {
    var translation = await translator.translate(
      widget.recognizedText,
      from: widget.fromLanguage.toLowerCase().substring(0, 2),
      to: widget.toLanguage.toLowerCase().substring(0, 2),
    );
    setState(() => _translatedText = translation.text);
  }

  Future<void> _speak() async {
    if (_translatedText == null) await _translateText();
    await flutterTts.setLanguage(widget.toLanguage);
    await flutterTts.speak(_translatedText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                "Choose Output Format",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),

              ElevatedButton.icon(
                icon: const Icon(Icons.text_fields),
                label: const Text("Text Form"),
                onPressed: () async {
                  await _translateText();
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Translated Text"),
                      content: Text(_translatedText ?? "Translating..."),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: const Icon(Icons.volume_up),
                label: const Text("Voice Form"),
                onPressed: _speak,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // for text-to-speech
import 'package:translator/translator.dart'; // for translation

class ChooseOutputScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String recognizedText;

  const ChooseOutputScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.recognizedText,
  });

  @override
  State<ChooseOutputScreen> createState() => _ChooseOutputScreenState();
}

class _ChooseOutputScreenState extends State<ChooseOutputScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  String? _translatedText;

  Future<void> _translateText() async {
    var translation = await translator.translate(
      widget.recognizedText,
      from: widget.fromLanguage.toLowerCase().substring(0, 2),
      to: widget.toLanguage.toLowerCase().substring(0, 2),
    );
    setState(() => _translatedText = translation.text);
  }

  Future<void> _speak() async {
    if (_translatedText == null) await _translateText();
    await flutterTts.setLanguage(widget.toLanguage);
    await flutterTts.speak(_translatedText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                "Choose Output Format",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),

              ElevatedButton.icon(
                icon: const Icon(Icons.text_fields),
                label: const Text("Text Form"),
                onPressed: () async {
                  await _translateText();
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text("Translated Text"),
                          content: Text(_translatedText ?? "Translating..."),
                        ),
                  );
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: const Icon(Icons.volume_up),
                label: const Text("Voice Form"),
                onPressed: _speak,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class ChooseOutputScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String recognizedText;

  const ChooseOutputScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.recognizedText,
  });

  @override
  State<ChooseOutputScreen> createState() => _ChooseOutputScreenState();
}

class _ChooseOutputScreenState extends State<ChooseOutputScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  String? _translatedText;

  Future<void> _translateText() async {
    var translation = await translator.translate(
      widget.recognizedText,
      from: widget.fromLanguage.toLowerCase().substring(0, 2),
      to: widget.toLanguage.toLowerCase().substring(0, 2),
    );
    setState(() => _translatedText = translation.text);
  }

  Future<void> _speak() async {
    if (_translatedText == null) await _translateText();
    await flutterTts.setLanguage(widget.toLanguage);
    await flutterTts.speak(_translatedText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A), // same as ListeningScreen
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Choose Output Format",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 50),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.text_fields, size: 28),
                label: const Text(
                  "Text Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  await _translateText();
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text("Translated Text"),
                          content: Text(
                            _translatedText ?? "Translating...",
                            style: const TextStyle(fontSize: 18),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                  );
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.volume_up, size: 28),
                label: const Text(
                  "Voice Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: _speak,
              ),

              const Spacer(),

              Text(
                "From: ${widget.fromLanguage}   →   To: ${widget.toLanguage}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class ChooseOutputScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String recognizedText;

  const ChooseOutputScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.recognizedText,
  });

  @override
  State<ChooseOutputScreen> createState() => _ChooseOutputScreenState();
}

class _ChooseOutputScreenState extends State<ChooseOutputScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  String? _translatedText;

  final Map<String, String> translateLanguageCodes = {
    'English': 'en',
    'Hindi': 'hi',
    'Telugu': 'te',
    'Spanish': 'es',
    'French': 'fr',
    'German': 'de',
    'Chinese': 'zh-CN',
  };

  final Map<String, String> ttsLanguageCodes = {
    'English': 'en-US',
    'Hindi': 'hi-IN',
    'Telugu': 'te-IN',
    'Spanish': 'es-ES',
    'French': 'fr-FR',
    'German': 'de-DE',
    'Chinese': 'zh-CN',
  };

  Future<void> _translateText() async {
    String fromCode = translateLanguageCodes[widget.fromLanguage] ?? 'en';
    String toCode = translateLanguageCodes[widget.toLanguage] ?? 'en';

    var translation = await translator.translate(
      widget.recognizedText,
      from: fromCode,
      to: toCode,
    );
    setState(() => _translatedText = translation.text);
  }

  Future<void> _speak() async {
    if (_translatedText == null) await _translateText();

    String ttsCode = ttsLanguageCodes[widget.toLanguage] ?? 'en-US';

    await flutterTts.setLanguage(ttsCode);
    await flutterTts.speak(_translatedText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Choose Output Format",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 50),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.text_fields, size: 28),
                label: const Text(
                  "Text Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  await _translateText();
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text("Translated Text"),
                          content: Text(
                            _translatedText ?? "Translating...",
                            style: const TextStyle(fontSize: 18),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                  );
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.volume_up, size: 28),
                label: const Text(
                  "Voice Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: _speak,
              ),

              const Spacer(),

              Text(
                "From: ${widget.fromLanguage}   →   To: ${widget.toLanguage}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class ChooseOutputScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String recognizedText;

  const ChooseOutputScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.recognizedText,
  });

  @override
  State<ChooseOutputScreen> createState() => _ChooseOutputScreenState();
}

class _ChooseOutputScreenState extends State<ChooseOutputScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();
  String? _translatedText;

  // Maps for translation and TTS language codes
  final Map<String, String> translateLanguageCodes = {
    'English': 'en',
    'Hindi': 'hi',
    'Telugu': 'te',
    'Spanish': 'es',
    'French': 'fr',
    'German': 'de',
    'Chinese': 'zh-CN',
  };

  final Map<String, String> ttsLanguageCodes = {
    'English': 'en-US',
    'Hindi': 'hi-IN',
    'Telugu': 'te-IN',
    'Spanish': 'es-ES',
    'French': 'fr-FR',
    'German': 'de-DE',
    'Chinese': 'zh-CN',
  };

  // Translate the recognized text
  Future<void> _translateText() async {
    String fromCode = translateLanguageCodes[widget.fromLanguage] ?? 'en';
    String toCode = translateLanguageCodes[widget.toLanguage] ?? 'en';

    var translation = await translator.translate(
      widget.recognizedText,
      from: fromCode,
      to: toCode,
    );

    setState(() => _translatedText = translation.text);
  }

  // Speak the translated text
  Future<void> _speak() async {
    if (_translatedText == null) await _translateText();

    String ttsCode = ttsLanguageCodes[widget.toLanguage] ?? 'en-US';
    await flutterTts.setLanguage(ttsCode);
    await flutterTts.speak(_translatedText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Choose Output Format",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 50),

              // Text Output Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.text_fields, size: 28),
                label: const Text(
                  "Text Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  await _translateText();
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text("Translated Text"),
                          content: Text(
                            _translatedText ?? "Translating...",
                            style: const TextStyle(fontSize: 18),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Voice Output Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.volume_up, size: 28),
                label: const Text(
                  "Voice Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: _speak,
              ),

              const Spacer(),

              // Language Info
              Text(
                "From: ${widget.fromLanguage}   →   To: ${widget.toLanguage}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class ChooseOutputScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String recognizedText;

  const ChooseOutputScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.recognizedText,
  });

  @override
  State<ChooseOutputScreen> createState() => _ChooseOutputScreenState();
}

class _ChooseOutputScreenState extends State<ChooseOutputScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();
  String? _translatedText;

  // Universal language codes
  final Map<String, String> languages = {
    'English': 'en',
    'Hindi': 'hi',
    'Telugu': 'te',
    'Tamil': 'ta',
    'Kannada': 'kn',
    'Malayalam': 'ml',
    'Bengali': 'bn',
    'Marathi': 'mr',
    'Gujarati': 'gu',
    'Punjabi': 'pa',
    'Urdu': 'ur',
    'Spanish': 'es',
    'French': 'fr',
    'German': 'de',
    'Chinese': 'zh-CN',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Arabic': 'ar',
    'Russian': 'ru',
  };

  // Convert to TTS locale
  String _getTtsLocale(String language) {
    // Append country codes for TTS
    switch (language) {
      case 'English':
        return 'en-US';
      case 'Hindi':
        return 'hi-IN';
      case 'Telugu':
        return 'te-IN';
      case 'Tamil':
        return 'ta-IN';
      case 'Kannada':
        return 'kn-IN';
      case 'Malayalam':
        return 'ml-IN';
      case 'Bengali':
        return 'bn-IN';
      case 'Marathi':
        return 'mr-IN';
      case 'Gujarati':
        return 'gu-IN';
      case 'Punjabi':
        return 'pa-IN';
      case 'Urdu':
        return 'ur-IN';
      case 'Spanish':
        return 'es-ES';
      case 'French':
        return 'fr-FR';
      case 'German':
        return 'de-DE';
      case 'Chinese':
        return 'zh-CN';
      case 'Japanese':
        return 'ja-JP';
      case 'Korean':
        return 'ko-KR';
      case 'Arabic':
        return 'ar-SA';
      case 'Russian':
        return 'ru-RU';
      default:
        return 'en-US';
    }
  }

  // Translate the recognized text
  Future<void> _translateText() async {
    String fromCode = languages[widget.fromLanguage] ?? 'en';
    String toCode = languages[widget.toLanguage] ?? 'en';

    var translation = await translator.translate(
      widget.recognizedText,
      from: fromCode,
      to: toCode,
    );

    setState(() => _translatedText = translation.text);
  }

  // Speak the translated text
  Future<void> _speak() async {
    if (_translatedText == null) await _translateText();
    String ttsLocale = _getTtsLocale(widget.toLanguage);
    await flutterTts.setLanguage(ttsLocale);
    await flutterTts.speak(_translatedText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Choose Output Format",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 50),

              // Text Output Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.text_fields, size: 28),
                label: const Text(
                  "Text Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  await _translateText();
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text("Translated Text"),
                          content: Text(
                            _translatedText ?? "Translating...",
                            style: const TextStyle(fontSize: 18),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Voice Output Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.volume_up, size: 28),
                label: const Text(
                  "Voice Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: _speak,
              ),

              const Spacer(),

              // Language Info
              Text(
                "From: ${widget.fromLanguage}   →   To: ${widget.toLanguage}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class ChooseOutputScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String recognizedText;

  const ChooseOutputScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.recognizedText,
  });

  @override
  State<ChooseOutputScreen> createState() => _ChooseOutputScreenState();
}

class _ChooseOutputScreenState extends State<ChooseOutputScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();
  String? _translatedText;

  // Universal language codes
  final Map<String, String> languages = {
    'English': 'en',
    'Hindi': 'hi',
    'Telugu': 'te',
    'Tamil': 'ta',
    'Kannada': 'kn',
    'Malayalam': 'ml',
    'Bengali': 'bn',
    'Marathi': 'mr',
    'Gujarati': 'gu',
    'Punjabi': 'pa',
    'Urdu': 'ur',
    'Spanish': 'es',
    'French': 'fr',
    'German': 'de',
    'Chinese': 'zh-CN',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Arabic': 'ar',
    'Russian': 'ru',
  };

  // Convert to TTS locale
  String _getTtsLocale(String language) {
    switch (language) {
      case 'English':
        return 'en-US';
      case 'Hindi':
        return 'hi-IN';
      case 'Telugu':
        return 'te-IN';
      case 'Tamil':
        return 'ta-IN';
      case 'Kannada':
        return 'kn-IN';
      case 'Malayalam':
        return 'ml-IN';
      case 'Bengali':
        return 'bn-IN';
      case 'Marathi':
        return 'mr-IN';
      case 'Gujarati':
        return 'gu-IN';
      case 'Punjabi':
        return 'pa-IN';
      case 'Urdu':
        return 'ur-IN';
      case 'Spanish':
        return 'es-ES';
      case 'French':
        return 'fr-FR';
      case 'German':
        return 'de-DE';
      case 'Chinese':
        return 'zh-CN';
      case 'Japanese':
        return 'ja-JP';
      case 'Korean':
        return 'ko-KR';
      case 'Arabic':
        return 'ar-SA';
      case 'Russian':
        return 'ru-RU';
      default:
        return 'en-US';
    }
  }

  Future<void> _translateText() async {
    String fromCode = languages[widget.fromLanguage] ?? 'en';
    String toCode = languages[widget.toLanguage] ?? 'en';

    var translation = await translator.translate(
      widget.recognizedText,
      from: fromCode,
      to: toCode,
    );

    setState(() => _translatedText = translation.text);
  }

  Future<void> _speak() async {
    if (_translatedText == null) await _translateText();
    String ttsLocale = _getTtsLocale(widget.toLanguage);
    await flutterTts.setLanguage(ttsLocale);
    await flutterTts.speak(_translatedText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC), // light blue background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Choose Output Format",
                style: TextStyle(
                  color: Colors.black, // text in black
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),

              // Text Output Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(
                  Icons.text_fields,
                  size: 28,
                  color: Colors.black,
                ),
                label: const Text(
                  "Text Form",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () async {
                  await _translateText();
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: const Text(
                            "Translated Text",
                            style: TextStyle(color: Colors.black),
                          ),
                          content: Text(
                            _translatedText ?? "Translating...",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Close",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Voice Output Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(
                  Icons.volume_up,
                  size: 28,
                  color: Colors.black,
                ),
                label: const Text(
                  "Voice Form",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: _speak,
              ),

              const Spacer(),

              // Language Info
              Text(
                "From: ${widget.fromLanguage}   →   To: ${widget.toLanguage}",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
