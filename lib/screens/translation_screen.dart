import 'package:flutter/material.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({super.key});

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
              // Title
              const Text(
                "Translation!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // Waveform placeholder box
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Icon(Icons.graphic_eq, color: Colors.white, size: 60),
                ),
              ),

              // Translation text box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 12,
                ),
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF111827), // dark navy
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "cafe’\nkahaan milegaa?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const Spacer(),

              // Stop button
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 30,
                  child: const Icon(Icons.stop, size: 34, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
