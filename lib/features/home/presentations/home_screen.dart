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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Logo",
                style: TextStyle(color: Colors.white),
              ),
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
          _lessonCard(),
          const SizedBox(height: 24),
          const Text("Haftaning eng yaxshi o’quvchilari",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _bestStudents(),
          const SizedBox(height: 24),
          const Text("Eng yaxshi do’stlar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _friendItem("Sabinaxon Rustamova", "2546 km", isPro: true),
          _friendItem("Lutfullo Toraev", "2035 km"),
          _friendItem("Xalmotov Ibroxim", "1890 km", isPro: true),
        ],
      ),
    );
  }

  Widget _lessonCard() {
    return Container(
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
    );
  }

  Widget _bestStudents() {
    return Row(
      children: [
        Expanded(child: _studentCard("Muhlisa Imomova", "16 soat", "11 modul")),
        const SizedBox(width: 12),
        Expanded(child: _studentCard("Husanjan Majidov", "12 soat", "8 modul")),
      ],
    );
  }

  Widget _studentCard(String name, String hours, String modules) {
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
            child: Image.network(
              "https://via.placeholder.com/100",
              height: 100,
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

  Widget _friendItem(String name, String km, {bool isPro = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFEBD9FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage("https://via.placeholder.com/50"),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(name)),
          Text(km, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (isPro)
            const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text("Pro",
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }
}
