import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> _titles = [
    'assets/onb1.png',
    'assets/onb2.png',
    'assets/onb3.png',
  ];

  final List<String> _descriptions = [
    'Ona tili ilovasiga xush kelibsiz!',
    'Yangi bilimlarni o‘rganing.',
    'Yutuqlaringizni kuzatib boring.',
  ];

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: _titles.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(_titles[index]),
                const SizedBox(height: 20),
                Text(
                  _descriptions[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 40),
                if (index == _titles.length - 1)
                  ElevatedButton(
                    onPressed: _completeOnboarding,
                    child: const Text('Boshlash'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
