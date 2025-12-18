import 'package:dart_basics_khytryi/models/student.dart';
import 'package:dart_basics_khytryi/models/course.dart';
import 'package:dart_basics_khytryi/models/university.dart';


void main() {
  print('=== University Management System Demo ===');
  runUniversityDemo();
}

void runUniversityDemo() {
  // University
  final university = University(name: 'Tech University');

  // Courses
  final dart = Course(
    id: 'DART101',
    name: 'Dart Basics',
    description: 'Intro to Dart',
    credits: 5,
    instructor: 'Dr. Smith',
  );

  final flutter = Course(
    id: 'FLUT201',
    name: 'Flutter',
    description: 'Flutter development',
    credits: 6,
    instructor: 'Dr. Brown',
    prerequisites: ['DART101'],
  );

  university.courses.addAll([dart, flutter]);

  // Student
  final student = Student(
    id: 'S1',
    firstName: 'Valentine',
    lastName: 'Khytryi',
    birthDate: DateTime(2005, 5, 10),
  );

  university.addStudent(student);

  // Enrollment
  student.enrollInCourse('DART101');
  student.addGrade('DART101', 90);

  // Check available courses
  print('\nAvailable courses for student:');
  print(university.getAvailableCoursesForStudent('S1'));

  // Enroll in Flutter
  student.enrollInCourse('FLUT201');
  student.addGrade('FLUT201', 95);

  // Output
  print('\nStudent info:');
  print(student);

  print('\nUniversity statistics:');
  print(university.generateStatistics());
}
