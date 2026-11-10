import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 101 - Layout Basics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const LayoutScreen(),
    );
  }
}

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('บทที่ 3: Column, Row & Container'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Container: การกำหนดกล่อง, ตกแต่งสี ขอบมน และเงา
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.teal.shade200, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(Icons.layers, size: 48, color: Colors.teal),
                  SizedBox(height: 8),
                  Text(
                    'Container & Decoration',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'กล่องสารพัดประโยชน์ กำหนด Padding, Margin, สี และขอบมนได้',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 2. Row: การจัดเรียงในแนวนอน (Horizontal Layout)
            const Text(
              'Row Layout (จัดเรียงแนวนอน):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFeatureCard(
                  icon: Icons.code,
                  title: 'Dart',
                  color: Colors.blue,
                ),
                _buildFeatureCard(
                  icon: Icons.phone_android,
                  title: 'Flutter',
                  color: Colors.teal,
                ),
                _buildFeatureCard(
                  icon: Icons.cloud_upload,
                  title: 'GitHub',
                  color: Colors.deepPurple,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 3. Info Banner แนวนอนโดยใช้ Row ผสม Icon + Expanded Text
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lightbulb, color: Colors.amber, size: 28),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'ทริค: ใช้ Expanded ครอบ Widget เมื่อต้องการให้ขยายเต็มพื้นที่ที่เหลือใน Row!',
                      style: TextStyle(fontSize: 13, color: Colors.brown),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper Widget สำหรับสร้างการ์ดไอคอนใน Row
  static Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: color),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
