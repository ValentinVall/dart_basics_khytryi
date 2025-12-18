import 'student.dart';

class Course {
  final String id;
  final String name;
  final String description;
  final int credits;
  final String instructor;
  final List<String> prerequisites;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.credits,
    required this.instructor,
    List<String>? prerequisites,
  }) : prerequisites = prerequisites ?? [];

  bool hasPrerequisites() => prerequisites.isNotEmpty;

  bool canStudentEnroll(Student student) {
    return prerequisites.every(
          (courseId) => student.getPassedCourses().contains(courseId),
    );
  }

  @override
  String toString() {
    return 'Course($id, $name, credits: $credits)';
  }
}
