import 'package:aiona_mobile/features/home/presentations/lesson_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCE91FF),
        title: Row(
          children: [
            SizedBox(
              height: 40,
              child: Image.asset('assets/Aiona.png'),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                "Test user",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Darsliklar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _lessonCard(context),
          const SizedBox(height: 24),
          const Text("Haftaning eng yaxshi o’quvchilari",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _bestStudents(),
          const SizedBox(height: 24),
          const Text("Eng yaxshi do’stlar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _friendItem("Sabinaxon Rustamova", "2546 km", "assets/sr.png",
              isPro: true),
          _friendItem("Lutfullo Toraev", "2035 km", "assets/lt.png"),
          _friendItem("Xalmotov Ibroxim", "1890 km", "assets/xi.png",
              isPro: true),
        ],
      ),
    );
  }

  Widget _lessonCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const LessonDetailScreen(
              videoUrl: 'https://youtu.be/QiNoWwU3IOU', // istalgan link
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFE6D6FF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset("assets/image.png")),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tanqidiy fikrlashni oshirish bo’yicha darsliklar",
                      style: TextStyle(fontSize: 14)),
                  SizedBox(height: 4),
                  Text("Umidjon Ishmuhammedov",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bestStudents() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: _studentCard(
                "Muhlisa Imomova", "16 soat", "11 modul", "assets/mi.png")),
        const SizedBox(width: 12),
        Expanded(
            child: _studentCard(
                "Husanjan Majidov", "12 soat", "8 modul", "assets/hm.png")),
      ],
    );
  }

  Widget _studentCard(
      String name, String hours, String modules, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFD9BFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text("Dars soati: $hours"),
          Text("Modullar: $modules"),
        ],
      ),
    );
  }

  Widget _friendItem(String name, String km, String imagePath,
      {bool isPro = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEBD9FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(name)),
          Text(km, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (isPro)
            const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                "Pro",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
