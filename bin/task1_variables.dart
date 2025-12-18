void main() {
  print('=== Dart Variables & Types ===');

  numbersDemo();
  stringsDemo();
  booleansDemo();
  collectionsDemo();
  nullSafetyDemo();
}

/* ===== Numbers ===== */
void numbersDemo() {
  int a = 10;
  double b = 2.5;
  num c = a + b;

  print('\nNumbers: a=$a, b=$b, a+b=$c');
  print('Parsed int: ${int.parse('5')}');
}

/* ===== Strings ===== */
void stringsDemo() {
  String name = 'Valentine Khytryi';
  print('\nName: $name');
  print('Uppercase: ${name.toUpperCase()}');
}

/* ===== Booleans ===== */
void booleansDemo() {
  int age = 18;
  bool isAdult = age >= 18;
  print('\nIs adult: $isAdult');
}

/* ===== Collections ===== */
void collectionsDemo() {
  List<int> list = [1, 2, 3];
  Set<String> set = {'Dart', 'Flutter'};
  Map<String, int> map = {'Math': 90};

  print('\nList: $list');
  print('Set: $set');
  print('Map: $map');
}

/* ===== Null safety ===== */
void nullSafetyDemo() {
  String? middleName;
  String name = middleName ?? 'No middle name';

  late int year;
  year = DateTime.now().year;

  print('\n$name, year: $year');
}
