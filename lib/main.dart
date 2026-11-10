import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 101 - Calculator Workshop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // 1. Controller สำหรับดึงและจัดการค่าจากช่องกรอกข้อมูล
  final TextEditingController _itemPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  // ตัวแปรเก็บผลลัพธ์ที่จะแสดงบนหน้าจอ
  double _totalAmount = 0.0;
  String _calculationSummary = 'ยังไม่มีการคำนวณ';

  /// ฟังก์ชันคำนวณยอดเงินรวม
  void _calculateTotal() {
    // ดึงค่าข้อความ แปลงเป็นตัวเลข (ถ้าว่างให้เป็น 0)
    final double price = double.tryParse(_itemPriceController.text) ?? 0.0;
    final int qty = int.tryParse(_quantityController.text) ?? 0;

    // เรียก setState() เพื่อบอก Flutter ให้ Re-render UI อัปเดตยอดเงินทันที!
    setState(() {
      _totalAmount = price * qty;
      _calculationSummary = 'ราคาชิ้นละ $price ฿ × จำนวน $qty ชิ้น';
    });
  }

  /// ฟังก์ชันรีเซ็ตค่า
  void _resetFields() {
    setState(() {
      _itemPriceController.clear();
      _quantityController.clear();
      _totalAmount = 0.0;
      _calculationSummary = 'รีเซ็ตข้อมูลเรียบร้อย';
    });
  }

  @override
  void dispose() {
    // คืนหน่วยความจำเมื่อเลิกใช้งาน Controller ป้องกัน Memory Leak
    _itemPriceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แอปคำนวณราคาสินค้า (Live Demo)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ป้ายแสดงสถานะด้านบน
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.bolt, color: Colors.indigo),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'ลองพิมพ์ตัวเลขแล้วกดปุ่ม "คำนวณราคารวม" สังเกตผลลัพธ์ Hot Reload / State เปลี่ยนทันที!',
                      style: TextStyle(fontSize: 13, color: Colors.indigo),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ช่องกรอกที่ 1: ราคาสินค้าต่อชิ้น
            TextField(
              controller: _itemPriceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'ราคาสินค้าต่อชิ้น (บาท)',
                hintText: 'เช่น 150',
                prefixIcon: const Icon(Icons.sell),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ช่องกรอกที่ 2: จำนวนชิ้น
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'จำนวนชิ้น (ชิ้น)',
                hintText: 'เช่น 3',
                prefixIcon: const Icon(Icons.shopping_basket),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // แถวปุ่ม Action: คำนวณ + ล้างค่า
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _calculateTotal,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.calculate),
                    label: const Text('คำนวณราคารวม', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: _resetFields,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('ล้างค่า'),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // การ์ดแสดงผลลัพธ์ (Result Card)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo.shade600, Colors.deepPurple.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'ยอดชำระเงินทั้งหมด',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_totalAmount.toStringAsFixed(2)} ฿',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(color: Colors.white30, height: 24),
                  Text(
                    _calculationSummary,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
