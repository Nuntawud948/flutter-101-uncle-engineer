/// ==========================================
/// บทที่ 1: พื้นฐานภาษา Dart (Dart Fundamentals)
/// คอร์ส: Flutter 101 - Uncle Engineer
/// ==========================================

void main() {
  print('--- ยินดีต้อนรับสู่การเรียนรู้ภาษา Dart! ---');

  // 1. ตัวแปรและชนิดข้อมูลพื้นฐาน (Variables & Data Types)
  String appName = 'Flutter 101 Note & Calc';
  int episode = 1;
  double version = 1.0;
  bool isFreeCourse = true;

  print('คอร์ส: $appName');
  print('EP: $episode, เวอร์ชัน: $version, เรียนฟรี: $isFreeCourse');

  // 2. การคำนวณและ String Interpolation
  int pricePerItem = 150;
  int quantity = 3;
  int totalPrice = calculateTotal(pricePerItem, quantity);
  print('ราคารวมสินค้า ($quantity ชิ้น ชิ้นละ $pricePerItem บาท): $totalPrice บาท');

  // 3. ฟังก์ชันพร้อม Optional Named Parameters
  showMemberCard(name: 'Nun', level: 'VIP', points: 250);

  // 4. โครงสร้างข้อมูล: List (รายการข้อมูล)
  List<String> topics = [
    'Dart Fundamentals',
    'Scaffold & AppBar',
    'Layout & Rows/Columns',
    'TextField & State Management'
  ];
  print('\nหัวข้อทั้งหมดที่ต้องเรียน (${topics.length} หัวข้อ):');
  for (int i = 0; i < topics.length; i++) {
    print('  ${i + 1}. ${topics[i]}');
  }

  // 5. โครงสร้างข้อมูล: Map (Key-Value)
  Map<String, dynamic> studentProfile = {
    'username': 'Nuntawud948',
    'role': 'Mobile App Developer Student',
    'progress': 'Module 01 - Started',
  };
  print('\nโปรไฟล์ผู้เรียน:');
  print('  ชื่อผู้ใช้: ${studentProfile['username']}');
  print('  สถานะ: ${studentProfile['progress']}');
  print('-------------------------------------------');
}

/// ฟังก์ชันคำนวณราคาสินค้า
int calculateTotal(int price, int qty) {
  return price * qty;
}

/// ฟังก์ชันพิมพ์บัตรสมาชิก พร้อมค่าเริ่มต้น (Default Parameters)
void showMemberCard({required String name, String level = 'Standard', int points = 0}) {
  print('บัตรสมาชิก: คุณ $name | ระดับ: $level | แต้มสะสม: $points แต้ม');
}
