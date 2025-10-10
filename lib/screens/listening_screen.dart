/*import 'package:flutter/material.dart';

class ListeningScreen extends StatelessWidget {
  const ListeningScreen({super.key});












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A), // Blue background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Listening text (blue + underline)
              const Text(
                "Listening...",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 30),

              // Mic + Waveform box
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: const [
                    Icon(Icons.mic, size: 60, color: Colors.black87),
                    SizedBox(height: 12),
                    Icon(Icons.graphic_eq, size: 50, color: Colors.black87), 
                    // You can replace with a custom SVG for exact match
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Spoken Text
              const Text(
                "Hey!\nwhere i can find\ncoffee shop?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              // Bottom buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Stop button
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 28,
                    child: const Icon(Icons.stop,
                        size: 30, color: Colors.black),
                  ),

                  // Help button
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 24,
                    child: const Icon(Icons.help_outline,
                        size: 26, color: Colors.black),
                  ),
                ],
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

class ListeningScreen extends StatelessWidget {
  final String fromLanguage;
  final String toLanguage;

  const ListeningScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A), // Blue background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Listening text
              const Text(
                "Listening...",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 30),

              // Mic + Waveform box
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: const [
                    Icon(Icons.mic, size: 60, color: Colors.black87),
                    SizedBox(height: 12),
                    Icon(Icons.graphic_eq, size: 50, color: Colors.black87),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Display selected languages
              Text(
                'Translating from $fromLanguage to $toLanguage',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              // Bottom buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Stop button
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 28,
                    child: const Icon(
                      Icons.stop,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),

                  // Help button
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 24,
                    child: const Icon(
                      Icons.help_outline,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                ],
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
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ListeningScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;

  const ListeningScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
  });

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';
  double _soundLevel = 0.0; // To animate mic/waveform

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done') {
          setState(() => _isListening = false);
        }
      },
      onError: (error) {
        print('Speech error: $error');
        setState(() => _isListening = false);
      },
    );

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) {
          setState(() {
            _spokenText = val.recognizedWords;
            _soundLevel = val.confidence; // Using confidence to animate (0–1)
          });
        },
        listenMode: stt.ListenMode.confirmation,
        onSoundLevelChange: (level) {
          setState(() {
            _soundLevel = level; // Updates mic animation
          });
        },
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Listening...",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 30),

              // Mic box with animation
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Transform.scale(
                      scale: 1 + _soundLevel * 0.5, // Mic reacts to voice
                      child: const Icon(
                        Icons.mic,
                        size: 60,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: _soundLevel / 10, // simple waveform effect
                      minHeight: 10,
                      color: Colors.black87,
                      backgroundColor: Colors.grey[400],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Text(
                'Translating from ${widget.fromLanguage} to ${widget.toLanguage}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Show recognized text
              Text(
                _spokenText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Stop / Start button
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 28,
                    child: IconButton(
                      icon: Icon(_isListening ? Icons.stop : Icons.mic),
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () {
                        if (_isListening) {
                          _stopListening();
                        } else {
                          _startListening();
                        }
                      },
                    ),
                  ),

                  // Help button
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 24,
                    child: const Icon(
                      Icons.help_outline,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                ],
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
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart'; // Make sure to create this file

class ListeningScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;

  const ListeningScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
  });

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _recognizedText = '';
  double _soundLevel = 0.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done') {
          setState(() => _isListening = false);
        }
      },
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) {
          setState(() {
            _recognizedText = val.recognizedWords;
          });
        },
        listenMode: stt.ListenMode.confirmation,
        onSoundLevelChange: (level) {
          setState(() => _soundLevel = level);
        },
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void _goToChooseOutput() {
    if (_recognizedText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseOutputScreen(
            fromLanguage: widget.fromLanguage,
            toLanguage: widget.toLanguage,
            recognizedText: _recognizedText,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please speak something first")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Listening...",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Transform.scale(
                  scale: 1 + _soundLevel * 0.05,
                  child: const Icon(Icons.mic, size: 60, color: Colors.black87),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                'Translating from ${widget.fromLanguage} to ${widget.toLanguage}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                _recognizedText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Mic control
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 28,
                    child: IconButton(
                      icon: Icon(_isListening ? Icons.stop : Icons.mic),
                      color: Colors.black,
                      onPressed: () {
                        if (_isListening) {
                          _stopListening();
                        } else {
                          _startListening();
                        }
                      },
                    ),
                  ),

                  // Next button
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 28,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.black),
                      onPressed: _goToChooseOutput,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
