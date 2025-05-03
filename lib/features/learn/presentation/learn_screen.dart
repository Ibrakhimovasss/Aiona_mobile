import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  List<Question> questions = [];
  int currentIndex = 0;
  int score = 0;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      final String response =
          await rootBundle.loadString('assets/questions.json');
      final List<dynamic> data = jsonDecode(response);
      setState(() {
        questions = data.map((e) => Question.fromJson(e)).toList();
      });
    } catch (e) {
      print("❌ JSON yuklanmadi: $e");
    }
  }

  void selectAnswer(String selected) {
    if (selectedAnswer != null) return;
    setState(() {
      selectedAnswer = selected;
    });

    bool isCorrect = questions[currentIndex].correct == selected;
    if (isCorrect) score += 4;

    Future.delayed(const Duration(milliseconds: 600), () {
      if (currentIndex < questions.length - 1) {
        setState(() {
          currentIndex++;
          selectedAnswer = null;
        });
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => ResultScreen(score: score),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        backgroundColor: Color(0xFFF3E5F5),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final question = questions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.arrow_back, color: Colors.deepPurple),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  const Text('Savol No_',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1C4E9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  question.question,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              ...question.options.map(
                (option) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: selectedAnswer == null
                        ? Colors.white
                        : option == question.correct
                            ? Colors.green.shade100
                            : option == selectedAnswer
                                ? Colors.red.shade100
                                : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.deepPurple.shade200),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(
                      option,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    trailing: const Icon(Icons.graphic_eq_rounded,
                        color: Colors.purple),
                    onTap: () => selectAnswer(option),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.blueAccent],
                    ),
                  ),
                  child: const Icon(Icons.mic, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  const ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test tugadi!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Sizning XP: $score', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            const Text('Liderboard tez orada...')
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final String correct;

  Question(
      {required this.question, required this.options, required this.correct});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] as String,
      options: List<String>.from(json['options']),
      correct: json['correct'] as String,
    );
  }
}
