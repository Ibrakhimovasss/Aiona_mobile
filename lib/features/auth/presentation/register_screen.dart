import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import 'widgets/auth_submit_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final loginCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  bool passHidden = true;
  bool confirmHidden = true;

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 16),
      firstDate: DateTime(1950),
      lastDate: now,
    );
    if (picked != null) {
      dateCtrl.text = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  void _register() {
    if (passCtrl.text == confirmCtrl.text && passCtrl.text.length >= 6) {
      context.go('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Parollar mos emas yoki juda qisqa')),
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
              child: Text("Ro‘yxatdan o‘tish",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary)),
            ),
            const SizedBox(height: 24),

            // Ism
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: 'Ism',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Tug‘ilgan sana
            TextField(
              controller: dateCtrl,
              readOnly: true,
              onTap: _selectDate,
              decoration: InputDecoration(
                labelText: "Tug'ilgan sana",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: const Icon(Icons.calendar_today),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Login
            TextField(
              controller: loginCtrl,
              decoration: InputDecoration(
                labelText: 'Login',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Parol
            TextField(
              controller: passCtrl,
              obscureText: passHidden,
              decoration: InputDecoration(
                labelText: 'Parol',
                suffixIcon: IconButton(
                  icon: Icon(
                      passHidden ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => passHidden = !passHidden),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Parolni takrorlash
            TextField(
              controller: confirmCtrl,
              obscureText: confirmHidden,
              decoration: InputDecoration(
                labelText: 'Parolni takrorlash',
                suffixIcon: IconButton(
                  icon: Icon(
                      confirmHidden ? Icons.visibility_off : Icons.visibility),
                  onPressed: () =>
                      setState(() => confirmHidden = !confirmHidden),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 24),
            AuthSubmitButton(text: 'Ro‘yxatdan o‘tish', onPressed: _register),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Akkount mavjudmi?"),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: const Text("Kirish"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
