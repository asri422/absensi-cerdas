import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50), // Green pesantren color
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Header with green background
          Container(
            width: double.infinity,
            height: 60,
            color: const Color(0xFF4CAF50), // Green pesantren color
            child: const Center(
              child: Text(
                '',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Main content area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  // Title with underline
                  const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 60,
                    color: const Color(0xFF4CAF50), // Green pesantren color
                    margin: const EdgeInsets.only(top: 8, bottom: 30),
                  ),

                  // Number field
                  _buildInputField('Number'),
                  const SizedBox(height: 16),

                  // Email field
                  _buildInputField('Email'),
                  const SizedBox(height: 16),

                  // Password field
                  _buildInputField('Password', isPassword: true),
                  const SizedBox(height: 16),

                  // Re-Password field
                  _buildInputField('Re-Password', isPassword: true),
                  const SizedBox(height: 30),

                  // Register button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement register functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF4CAF50,
                        ), // Green pesantren color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'DAFTAR',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login link
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to login
                    },
                    child: const Text(
                      'Sudah punya akun? Log In',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer with green background
          Container(
            width: double.infinity,
            height: 60,
            color: const Color(0xFF4CAF50), // Green pesantren color
            child: const Center(
              child: Text(
                'MIFTAHUL ULUM BETTET',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build input fields
  Widget _buildInputField(String hintText, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
      ),
    );
  }
}
