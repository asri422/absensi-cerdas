import 'package:flutter/material.dart';
import 'package:aplikasiku/login/forgot_password_page.dart';
import 'package:aplikasiku/login/register_page.dart';
import 'package:aplikasiku/screens/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              // Mengatur alignment seperti di video
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // STEP 1: LOGO
                // (Ganti "assets/absensi_png.png" dengan path logo Anda)
                /*
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/absensi_png.png",
                    fit: BoxFit.contain,
                  ),
                ),
                */
                const SizedBox(height: 48.0),

                // STEP 2: INPUT EMAIL
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  // initialValue: 'alucard@gmail.com', // Opsional dari video
                  decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.fromLTRB(
                      20.0,
                      10.0,
                      20.0,
                      10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),

                // STEP 3: INPUT PASSWORD
                TextFormField(
                  autofocus: false,
                  // initialValue: 'somepassword', // Opsional dari video
                  obscureText: true, // Menyembunyikan password
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.fromLTRB(
                      20.0,
                      10.0,
                      20.0,
                      10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),

                // STEP 4: TOMBOL LOGIN
                // Menggunakan ElevatedButton (pengganti RaisedButton)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: const EdgeInsets.all(12),
                      backgroundColor:
                          Colors.lightBlueAccent, // Warna dari video
                      foregroundColor: Colors.white, // Warna teks
                    ),
                    onPressed: () {
                      // Navigate to home page after login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // STEP 5: TOMBOL LUPA PASSWORD
                // Menggunakan TextButton (pengganti FlatButton)
                TextButton(
                  onPressed: () {
                    // TODO: Arahkan ke halaman lupa password
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),

                // Register link
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Don\'t have an account? Register',
                    style: TextStyle(color: Colors.black54),
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
