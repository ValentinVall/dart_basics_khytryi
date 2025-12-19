import 'dart:math';

void main() {
  print('=== Dart Collections & Data Processing Demo ===');

  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
}

void demonstrateLists() {
  print('\n--- Lists Demo ---');
  List<int> numbers = [1, 2, 3, 4, 5, 6];

  // Filtering
  var evenNumbers = numbers.where((n) => n % 2 == 0).toList();
  print('Even numbers: $evenNumbers');

  // Mapping
  var squares = numbers.map((n) => n * n).toList();
  print('Squares: $squares');

  // Reducing
  var sum = numbers.reduce((a, b) => a + b);
  print('Sum: $sum');
}

void demonstrateSets() {
  print('\n--- Sets Demo ---');
  Set<String> skillsA = {'Dart', 'Flutter', 'SQL'};
  Set<String> skillsB = {'Java', 'Flutter', 'Python'};

  print('Union: ${skillsA.union(skillsB)}');
  print('Intersection: ${skillsA.intersection(skillsB)}');
  print('Difference: ${skillsA.difference(skillsB)}');
}

void demonstrateMaps() {
  print('\n--- Maps Demo ---');
  Map<String, int> wordCount = {
    'dart': 3,
    'flutter': 5,
    'async': 2,
  };

  wordCount.forEach((word, count) {
    print('$word → $count');
  });

  // Transform
  var doubled = wordCount.map((key, value) => MapEntry(key, value * 2));
  print('Doubled counts: $doubled');
}

void demonstrateAdvancedOperations() {
  print('\n--- Advanced Operations ---');
  List<Map<String, dynamic>> students = [
    {'name': 'Alice', 'gpa': 3.8},
    {'name': 'Bob', 'gpa': 2.9},
    {'name': 'Charlie', 'gpa': 3.5},
  ];

  // Sort by GPA
  students.sort((a, b) => (b['gpa'] as double).compareTo(a['gpa'] as double));
  print('Sorted students: $students');

  // Nested collections
  Map<String, List<String>> courses = {
    'Math': ['Alice', 'Charlie'],
    'CS': ['Bob', 'Alice'],
  };
  print('Courses: $courses');
}