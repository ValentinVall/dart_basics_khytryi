void main() {
  print('=== Dart Functions Demo ===');

  print('Sum: ${calculateSum(3, 5)}');
  print('Average: ${calculateAverage([4, 6, 8])}');
  print(formatName('Valentine', 'Khytryi', uppercase: true));

  print('Factorial 5 = ${factorial(5)}');
  print('Fibonacci 6 = ${fibonacci(6)}');

  functionalDemo();
}

/* ===== Basic functions ===== */
int calculateSum(int a, int b) => a + b;

double calculateAverage(List<double> numbers) =>
    numbers.reduce((a, b) => a + b) / numbers.length;

/* ===== Named & optional parameters ===== */
String formatName(
    String firstName,
    String lastName, {
      String? middleName,
      bool uppercase = false,
    }) {
  String name =
  middleName == null ? '$firstName $lastName' : '$firstName $middleName $lastName';
  return uppercase ? name.toUpperCase() : name;
}

/* ===== Functional programming ===== */
void functionalDemo() {
  List<int> nums = [1, 2, 3, 4, 5];

  var even = nums.where((n) => n.isEven).toList();
  var squared = nums.map((n) => n * n).toList();
  var sum = nums.fold(0, (a, b) => a + b);

  print('Even: $even');
  print('Squared: $squared');
  print('Fold sum: $sum');
}

/* ===== Recursive functions ===== */
int factorial(int n) => n <= 1 ? 1 : n * factorial(n - 1);

int fibonacci(int n) => n <= 1 ? n : fibonacci(n - 1) + fibonacci(n - 2);
