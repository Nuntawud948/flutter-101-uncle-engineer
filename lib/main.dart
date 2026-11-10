import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 101 - Uncle Engineer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. แถบหัวแอปพลิเคชันด้านบน
      appBar: AppBar(
        title: const Text(
          'Flutter 101: Scaffold & Widgets',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              debugPrint('กดปุ่มแจ้งเตือน!');
            },
          ),
        ],
      ),

      // 2. เนื้อหาหลักของหน้าจอ จัดให้อยู่กึ่งกลางด้วย Center
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.flutter_dash,
              size: 80,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 16),
            const Text(
              'ยินดีต้อนรับสู่แอปแรกของคุณ!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'สร้างด้วย Scaffold, AppBar และ Center Widget',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),

      // 3. ปุ่มลอยมุมขวาล่าง (Floating Action Button)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('กดปุ่ม Floating Action Button!');
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
