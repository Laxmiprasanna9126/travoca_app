/*import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF233D9B), // same blue color
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Logo
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",

                    // replace with your logo path
                    height: 120,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your trusted voice translation app",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        // TODO: Navigate to sign in page
                      },
                      child: const Text("Sign In"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        // TODO: Navigate to sign up page
                      },
                      child: const Text("Sign up"),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Help icon button at bottom right
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
            ),
          ],
        ),
      ),
    );
  }
}
*/ /*
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF233D9B),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: height * 0.15,
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      "Your trusted voice translation app",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: height * 0.08),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.02,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text("Sign In"),
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.02,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom-right help button
            Positioned(
              bottom: 16,
              right: 16,
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
    );
  }
}
*/ /*
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF233D9B),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      "assets/images/logo.png",
                      height: height * 0.15,
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      "Your trusted voice translation app",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: height * 0.08),

                    // Sign In Button → Go to LoginScreen
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.02,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text("Sign In"),
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    // Sign Up Button → Go to SignUpScreen
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.02,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Help button at bottom right
            Positioned(
              bottom: 16,
              right: 16,
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
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A), // Deep blue background
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🔹 Travoca Logo
                    Image.asset(
                      "assets/images/logo.png",
                      height: height * 0.18,
                    ),
                    const SizedBox(height: 25),

                    // 🔹 App tagline
                    const Text(
                      "Your trusted voice translation app",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 70),

                    // 🔹 Sign In button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1E3A8A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // 🔹 Sign Up button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1E3A8A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🔹 Help button (bottom-right corner)
            Positioned(
              bottom: 20,
              right: 20,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(
                    Icons.help_outline,
                    color: Color(0xFF1E3A8A),
                    size: 26,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            title: const Text("Need Help?"),
                            content: const Text(
                              "For assistance, contact our support team at:\n"
                              "support@travoca.com",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
