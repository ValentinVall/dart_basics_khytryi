import 'student.dart';
import 'course.dart';

/* ===== Abstract Person ===== */
abstract class Person {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  String get fullName => '$firstName $lastName';
  int get age => DateTime.now().year - birthDate.year;
  String get role;
}

/* ===== Professor ===== */
class Professor extends Person {
  final String department;
  final double salary;
  final List<String> taughtCourses;

  Professor({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    required this.department,
    required this.salary,
    List<String>? taughtCourses,
  }) : taughtCourses = taughtCourses ?? [];

  @override
  String get role => 'Professor';
}

/* ===== University ===== */
class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;

  University({
    required this.name,
    List<Student>? students,
    List<Professor>? professors,
    List<Course>? courses,
  })  : students = students ?? [],
        professors = professors ?? [],
        courses = courses ?? [];

  /* ===== CRUD ===== */
  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(String studentId) {
    students.removeWhere((s) => s.id == studentId);
  }

  Student? findStudentById(String id) {
    for (final student in students) {
      if (student.id == id) {
        return student;
      }
    }
    return null;
  }


  List<Student> getStudentsByCourse(String courseId) {
    return students
        .where((s) => s.enrolledCourses.contains(courseId))
        .toList();
  }

  List<Course> getAvailableCoursesForStudent(String studentId) {
    final student = findStudentById(studentId);
    if (student == null) return [];

    return courses
        .where((c) =>
    !student.enrolledCourses.contains(c.id) &&
        c.canStudentEnroll(student))
        .toList();
  }

  Map<String, dynamic> generateStatistics() {
    double avgGpa = students.isEmpty
        ? 0
        : students.map((s) => s.gpa).reduce((a, b) => a + b) / students.length;

    return {
      'studentsCount': students.length,
      'coursesCount': courses.length,
      'averageGPA': avgGpa.toStringAsFixed(2),
    };
  }
}
