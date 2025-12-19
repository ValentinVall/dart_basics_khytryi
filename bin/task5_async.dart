// bin/task5_async.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../lib/models/student.dart';

Future<void> main() async {
  print('=== Dart Async Programming Demo ===');

  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

// Симуляція API-запиту
Future<String> fetchStudentData(String studentId) async {
  await Future.delayed(Duration(seconds: 1));
  return 'Data for student $studentId';
}

// Читання студентів з JSON файлу
Future<List<Student>> loadStudentsFromFile(String filename) async {
  final file = File(filename);
  final content = await file.readAsString();
  final List<dynamic> jsonData = jsonDecode(content);
  return jsonData.map((e) => Student.fromJson(e)).toList();
}

// Запис студентів у JSON файл
Future<void> saveStudentsToFile(List<Student> students, String filename) async {
  final file = File(filename);
  final jsonData = students.map((s) => s.toJson()).toList();
  await file.writeAsString(jsonEncode(jsonData));
}

// Stream генерація студентів
Stream<Student> studentStream(List<Student> students) async* {
  for (var student in students) {
    await Future.delayed(Duration(milliseconds: 500));
    yield student;
  }
}

// Демонстрація роботи з Future
Future<void> demonstrateFutures() async {
  print('\n--- Futures Demo ---');
  try {
    var results = await Future.wait([
      fetchStudentData('S001'),
      fetchStudentData('S002'),
      fetchStudentData('S003'),
    ]);
    print('Fetched results: $results');
  } catch (e) {
    print('Error: $e');
  }
}

// Демонстрація роботи зі Stream
Future<void> demonstrateStreams() async {
  print('\n--- Streams Demo ---');
  var students = [
    Student(id: 'S001', firstName: 'Valentine', lastName: 'Khytryi', birthDate: DateTime(2000)),
    Student(id: 'S002', firstName: 'Maksym', lastName: 'Katsemir', birthDate: DateTime(1999)),
  ];

  await for (var student in studentStream(students)) {
    print('Streamed student: ${student.fullName}');
  }
}

// Демонстрація роботи з файлами
Future<void> demonstrateFileOperations() async {
  print('\n--- File Operations Demo ---');
  var students = [
    Student(id: 'S001', firstName: 'Valentine', lastName: 'Khytryi', birthDate: DateTime(2000)),
    Student(id: 'S002', firstName: 'Maksym', lastName: 'Katsemir', birthDate: DateTime(1999)),
  ];

  await saveStudentsToFile(students, 'students.json');
  print('Students saved to file.');

  var loaded = await loadStudentsFromFile('students.json');
  print('Loaded students: ${loaded.map((s) => s.fullName).toList()}');
}