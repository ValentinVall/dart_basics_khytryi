import '../models/student.dart';
import '../models/university.dart';

class DataProcessor {
// Робота з Lists
static List<int> filterEvenNumbers(List<int> numbers) {
return numbers.where((n) => n % 2 == 0).toList();
}

static Map<String, int> countWords(String text) {
final words = text
    .toLowerCase()
    .replaceAll(RegExp(r'[^a-zа-я0-9 ]'), '')
    .split(' ')
    .where((w) => w.isNotEmpty);

final Map<String, int> result = {};
for (var word in words) {
result[word] = (result[word] ?? 0) + 1;
}
return result;
}

static List<Student> sortStudentsByGPA(List<Student> students) {
students.sort((a, b) => b.gpa.compareTo(a.gpa));
return students;
}

// Робота з Sets
static Set<String> getUniqueSkills(List<Student> students) {
final Set<String> skills = {};
for (var student in students) {
if (student is SkillfulStudent) {
skills.addAll(student.skills);
}
}
return skills;
}

static Set<String> findCommonCourses(List<Student> students) {
if (students.isEmpty) return {};
Set<String> common = students.first.enrolledCourses.toSet();
for (var student in students.skip(1)) {
common = common.intersection(student.enrolledCourses.toSet());
}
return common;
}

// Робота з Maps
static Map<String, List<Student>> groupStudentsByYear(List<Student> students) {
final Map<String, List<Student>> grouped = {};
for (var student in students) {
final year = student.birthDate.year.toString();
grouped.putIfAbsent(year, () => []).add(student);
}
return grouped;
}

static Map<String, double> calculateAverageGradesByCourse(List<Student> students) {
final Map<String, List<double>> courseGrades = {};
for (var student in students) {
student.grades.forEach((course, grade) {
courseGrades.putIfAbsent(course, () => []).add(grade);
});
}

final Map<String, double> averages = {};
courseGrades.forEach((course, grades) {
averages[course] = grades.reduce((a, b) => a + b) / grades.length;
});
return averages;
}

// Advanced operations
static List<Map<String, dynamic>> generateReport(University university) {
return university.students.map((student) {
return {
'id': student.id,
'name': student.fullName,
'gpa': student.gpa,
'passedCourses': student.getPassedCourses(),
};
}).toList();
}
}
