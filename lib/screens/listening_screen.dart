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
/*
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
*/
/*
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart';

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
      setState(() {
        _isListening = true;
        _recognizedText = '';
      });
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
          builder:
              (context) => ChooseOutputScreen(
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
              // Listening text only when listening
              if (_isListening)
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

              // Mic animation
              CircleAvatar(
                radius: 60,
                backgroundColor:
                    _isListening ? Colors.redAccent : Colors.grey[300],
                child: Transform.scale(
                  scale: 1 + (_isListening ? _soundLevel * 0.1 : 0),
                  child: Icon(
                    _isListening ? Icons.mic : Icons.mic_none,
                    size: 60,
                    color: _isListening ? Colors.white : Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                'Translating from ${widget.fromLanguage} to ${widget.toLanguage}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),

              const SizedBox(height: 20),

              // Recognized text in a card
              if (_recognizedText.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    _recognizedText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black87, fontSize: 20),
                  ),
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
                      icon: Icon(
                        _isListening ? Icons.stop_circle : Icons.mic,
                        color: Colors.black,
                        size: 30,
                      ),
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
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
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
*/
/*
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart';

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
        if (status == 'done' || status == 'notListening') {
          setState(() => _isListening = false);
        }
      },
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
        _recognizedText = '';
      });

      _speech.listen(
        onResult: (val) {
          setState(() {
            _recognizedText = val.recognizedWords;
          });
        },
        listenMode: stt.ListenMode.dictation,
        partialResults: true,
        // Optional: set locale to match fromLanguage
        localeId: _getLocaleId(widget.fromLanguage),
        onSoundLevelChange: (level) {
          setState(() => _soundLevel = level);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available")),
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

  String _getLocaleId(String language) {
    switch (language.toLowerCase()) {
      case 'english':
        return 'en_US';
      case 'hindi':
        return 'hi_IN';
      case 'telugu':
        return 'te_IN';
      default:
        return 'en_US';
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
              // Screen heading
              const Text(
                "Voice Translator",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),

              const SizedBox(height: 20),

              // Listening text
              if (_isListening)
                const Text(
                  "Listening...",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),

              const SizedBox(height: 20),

              // Mic animation
              CircleAvatar(
                radius: 60,
                backgroundColor:
                    _isListening ? Colors.redAccent : Colors.grey[300],
                child: Transform.scale(
                  scale: 1 + (_isListening ? _soundLevel * 0.1 : 0),
                  child: Icon(
                    _isListening ? Icons.mic : Icons.mic_none,
                    size: 60,
                    color: _isListening ? Colors.white : Colors.black87,
                  ),
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

              // Recognized text box
              if (_recognizedText.isNotEmpty)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Text(
                    _recognizedText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
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
                      icon: Icon(
                        _isListening ? Icons.stop_circle : Icons.mic,
                        color: Colors.black,
                        size: 30,
                      ),
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
*/
/*
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart';

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
        if (status == 'done' || status == 'notListening') {
          setState(() => _isListening = false);
        }
      },
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
        _recognizedText = '';
      });

      _speech.listen(
        onResult: (val) {
          setState(() {
            _recognizedText = val.recognizedWords;
          });
        },
        listenMode: stt.ListenMode.dictation,
        partialResults: true,
        localeId: _getLocaleId(widget.fromLanguage),
        onSoundLevelChange: (level) {
          setState(() => _soundLevel = level);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available")),
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
          builder:
              (context) => ChooseOutputScreen(
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

  String _getLocaleId(String language) {
    switch (language.toLowerCase()) {
      case 'english':
        return 'en_US';
      case 'hindi':
        return 'hi_IN';
      case 'telugu':
        return 'te_IN';
      default:
        return 'en_US';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A), // same as previous screens
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Screen heading
              const Text(
                "Voice Translator",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),

              const SizedBox(height: 20),

              // Listening text
              if (_isListening)
                const Text(
                  "Listening...",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),

              const SizedBox(height: 20),

              // Mic animation
              CircleAvatar(
                radius: 60,
                backgroundColor:
                    _isListening ? Colors.lightBlueAccent : Colors.grey[300],
                child: Transform.scale(
                  scale: 1 + (_isListening ? _soundLevel * 0.1 : 0),
                  child: Icon(
                    _isListening ? Icons.mic : Icons.mic_none,
                    size: 60,
                    color: _isListening ? Colors.white : Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                'Translating from ${widget.fromLanguage} to ${widget.toLanguage}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),

              const SizedBox(height: 20),

              // Live recognized text box
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _recognizedText.isEmpty
                          ? "Your spoken text will appear here..."
                          : _recognizedText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Mic control
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 28,
                    child: IconButton(
                      icon: Icon(
                        _isListening ? Icons.stop_circle : Icons.mic,
                        color: Colors.black,
                        size: 30,
                      ),
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
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
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
*/
/*
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart';

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

class _ListeningScreenState extends State<ListeningScreen>
    with SingleTickerProviderStateMixin {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _recognizedText = '';
  double _soundLevel = 0.0;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          setState(() => _isListening = false);
          _animationController.reverse();
        }
      },
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
        _recognizedText = '';
      });
      _animationController.forward();

      _speech.listen(
        onResult: (val) {
          setState(() {
            _recognizedText = val.recognizedWords;
          });
        },
        listenMode: stt.ListenMode.dictation,
        partialResults: true,
        localeId: _getLocaleId(widget.fromLanguage),
        onSoundLevelChange: (level) {
          setState(() => _soundLevel = level);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available")),
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
    _animationController.reverse();
  }

  void _goToChooseOutput() {
    if (_recognizedText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ChooseOutputScreen(
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

  String _getLocaleId(String language) {
    switch (language.toLowerCase()) {
      case 'english':
        return 'en_US';
      case 'hindi':
        return 'hi_IN';
      case 'telugu':
        return 'te_IN';
      default:
        return 'en_US';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Voice Translator",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 40),

                // Mic Button
                GestureDetector(
                  onTap: () {
                    if (_isListening) {
                      _stopListening();
                    } else {
                      _startListening();
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 100 + (_isListening ? _soundLevel * 30 : 0),
                    height: 100 + (_isListening ? _soundLevel * 30 : 0),
                    decoration: BoxDecoration(
                      color:
                          _isListening ? Colors.lightBlueAccent : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      size: 50,
                      color: _isListening ? Colors.white : Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Pop-up box for recognized text
                SizeTransition(
                  sizeFactor: _animationController,
                  axisAlignment: -1.0,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _recognizedText.isEmpty
                            ? "Speak now..."
                            : _recognizedText,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Next Button
                if (_recognizedText.isNotEmpty)
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 28,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      onPressed: _goToChooseOutput,
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
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart';

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

class _ListeningScreenState extends State<ListeningScreen>
    with SingleTickerProviderStateMixin {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _recognizedText = '';
  double _soundLevel = 0.0;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          setState(() => _isListening = false);
          _animationController.reverse();
        }
      },
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
        _recognizedText = '';
      });
      _animationController.forward();

      _speech.listen(
        onResult: (val) {
          setState(() {
            _recognizedText = val.recognizedWords;
          });
        },
        listenMode: stt.ListenMode.dictation,
        partialResults: true,
        localeId: _getLocaleId(widget.fromLanguage),
        onSoundLevelChange: (level) {
          setState(() => _soundLevel = level);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available")),
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
    _animationController.reverse();
  }

  void _goToChooseOutput() {
    if (_recognizedText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ChooseOutputScreen(
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

  String _getLocaleId(String language) {
    switch (language.toLowerCase()) {
      case 'english':
        return 'en_US';
      case 'hindi':
        return 'hi_IN';
      case 'telugu':
        return 'te_IN';
      default:
        return 'en_US';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Updated background color to match previous screens
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Color(0xFF3B82F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Voice Translator",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Mic Button
                  GestureDetector(
                    onTap: () {
                      if (_isListening) {
                        _stopListening();
                      } else {
                        _startListening();
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 100 + (_isListening ? _soundLevel * 30 : 0),
                      height: 100 + (_isListening ? _soundLevel * 30 : 0),
                      decoration: BoxDecoration(
                        color:
                            _isListening
                                ? Colors.lightBlueAccent
                                : Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        _isListening ? Icons.mic : Icons.mic_none,
                        size: 50,
                        color: _isListening ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Pop-up box for recognized text
                  SizeTransition(
                    sizeFactor: _animationController,
                    axisAlignment: -1.0,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          _recognizedText.isEmpty
                              ? "Speak now..."
                              : _recognizedText,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Next Button
                  if (_recognizedText.isNotEmpty)
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 28,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: _goToChooseOutput,
                      ),
                    ),
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
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart';

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
        // Only stop listening when user presses stop
        print('Speech status: $status');
      },
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
        _recognizedText = '';
      });

      _speech.listen(
        onResult: (val) {
          setState(() {
            _recognizedText = val.recognizedWords;
          });
        },
        listenMode: stt.ListenMode.dictation,
        partialResults: true,
        localeId: _getLocaleId(widget.fromLanguage),
        onSoundLevelChange: (level) {
          setState(() => _soundLevel = level);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available")),
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
          builder:
              (context) => ChooseOutputScreen(
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

  String _getLocaleId(String language) {
    switch (language.toLowerCase()) {
      case 'english':
        return 'en_US';
      case 'hindi':
        return 'hi_IN';
      case 'telugu':
        return 'te_IN';
      default:
        return 'en_US';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // light blue background
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Voice Translator",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 40),

                // Mic Button
                GestureDetector(
                  onTap: () {
                    if (_isListening) {
                      _stopListening();
                    } else {
                      _startListening();
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 100 + (_isListening ? _soundLevel * 30 : 0),
                    height: 100 + (_isListening ? _soundLevel * 30 : 0),
                    decoration: BoxDecoration(
                      color: _isListening ? Colors.white : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      size: 50,
                      color:
                          _isListening
                              ? Colors.lightBlueAccent
                              : Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Recognized text box (always visible when listening)
                if (_isListening || _recognizedText.isNotEmpty)
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxHeight: 300,
                    ), // allows dynamic growth
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _recognizedText.isEmpty
                            ? "Speak now..."
                            : _recognizedText,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 30),

                // Next Button
                if (_recognizedText.isNotEmpty)
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 28,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.lightBlueAccent,
                      ),
                      onPressed: _goToChooseOutput,
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
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart';

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
        // Do not reverse box while listening
        print('Speech status: $status');
      },
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
        _recognizedText = '';
      });

      _speech.listen(
        onResult: (val) {
          setState(() {
            _recognizedText = val.recognizedWords;
          });
        },
        listenMode: stt.ListenMode.dictation,
        partialResults: true,
        localeId: _getLocaleId(widget.fromLanguage),
        onSoundLevelChange: (level) {
          setState(() => _soundLevel = level);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available")),
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
          builder:
              (context) => ChooseOutputScreen(
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

  String _getLocaleId(String language) {
    switch (language.toLowerCase()) {
      case 'english':
        return 'en_US';
      case 'hindi':
        return 'hi_IN';
      case 'telugu':
        return 'te_IN';
      default:
        return 'en_US';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC), // exact previous screen color
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Voice Translator",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // heading text white
                  ),
                ),
                const SizedBox(height: 40),

                // Mic Button
                GestureDetector(
                  onTap: () {
                    if (_isListening) {
                      _stopListening();
                    } else {
                      _startListening();
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 100 + (_isListening ? _soundLevel * 30 : 0),
                    height: 100 + (_isListening ? _soundLevel * 30 : 0),
                    decoration: BoxDecoration(
                      color: Colors.white, // mic circle background
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      size: 50,
                      color:
                          _isListening
                              ? Colors.lightBlueAccent
                              : Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Recognized text box (shows only after clicking mic)
                if (_isListening || _recognizedText.isNotEmpty)
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxHeight: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _recognizedText.isEmpty
                            ? "Speak now..."
                            : _recognizedText,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 30),

                // Next Button
                if (_recognizedText.isNotEmpty)
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 28,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF1E3A8A),
                      ),
                      onPressed: _goToChooseOutput,
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
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'choose_output.dart';

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
        // Do not auto-reverse box
        print('Speech status: $status');
      },
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
        _recognizedText = '';
      });

      _speech.listen(
        onResult: (val) {
          setState(() {
            _recognizedText = val.recognizedWords;
          });
        },
        listenMode: stt.ListenMode.dictation,
        partialResults: true,
        localeId: _getLocaleId(widget.fromLanguage),
        onSoundLevelChange: (level) {
          setState(() => _soundLevel = level);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available")),
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
          builder:
              (context) => ChooseOutputScreen(
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

  String _getLocaleId(String language) {
    switch (language.toLowerCase()) {
      case 'english':
        return 'en_US';
      case 'hindi':
        return 'hi_IN';
      case 'telugu':
        return 'te_IN';
      default:
        return 'en_US';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC), // dark blue as previous screens
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Main heading
                const Text(
                  "Voice Translation",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // "Listening..." text appears only while mic is active
                if (_isListening)
                  const Text(
                    "Listening...",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                if (_isListening) const SizedBox(height: 20),

                // Mic Button
                GestureDetector(
                  onTap: () {
                    if (_isListening) {
                      _stopListening();
                    } else {
                      _startListening();
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 100 + (_isListening ? _soundLevel * 30 : 0),
                    height: 100 + (_isListening ? _soundLevel * 30 : 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      size: 50,
                      color:
                          _isListening
                              ? Colors.lightBlueAccent
                              : Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Recognized text box (appears when mic is pressed or after speaking)
                if (_isListening || _recognizedText.isNotEmpty)
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxHeight: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _recognizedText.isEmpty
                            ? "Speak now..."
                            : _recognizedText,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 30),

                // Next Button (shows only after user has spoken)
                if (_recognizedText.isNotEmpty)
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 28,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF1E3A8A),
                      ),
                      onPressed: _goToChooseOutput,
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
