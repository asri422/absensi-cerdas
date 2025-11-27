import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lupa Password')),
      body: const Center(
        child: Text(
          'Halaman untuk reset password akan ada di sini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
