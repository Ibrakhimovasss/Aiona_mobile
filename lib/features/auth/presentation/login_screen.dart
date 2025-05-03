import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import 'widgets/auth_submit_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool isHidden = true;

  void _login() {
    if (emailCtrl.text.isNotEmpty && passCtrl.text.isNotEmpty) {
      context.go('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Iltimos, ma’lumotlarni to‘g‘ri kiriting')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('Xush kelibsiz!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  )),
            ),
            const SizedBox(height: 10),
            const Center(child: Text("Ro'yxatdan o'ting yoki tizimga kiring.")),
            const SizedBox(height: 30),
            Center(child: Image.asset('assets/login.png', height: 160)),
            const SizedBox(height: 30),

            // Login TextField (inline)
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                labelText: 'Login',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Parol TextField (inline)
            TextField(
              controller: passCtrl,
              obscureText: isHidden,
              decoration: InputDecoration(
                labelText: 'Parol',
                suffixIcon: IconButton(
                  icon:
                      Icon(isHidden ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => isHidden = !isHidden),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Parolni unutdingizmi?'),
              ),
            ),
            const SizedBox(height: 20),
            AuthSubmitButton(text: 'Kirish', onPressed: _login),
            const SizedBox(height: 12),
            const Center(child: Text("yoki")),
            const SizedBox(height: 12),
            AuthSubmitButton(
              text: 'Ro’yxatdan o’tish',
              onPressed: () => context.go('/register'),
            ),
          ],
        ),
      ),
    );
  }
}
