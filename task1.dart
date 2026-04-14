import 'dart:io';

double? checknumber(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print("Error: Input cannot be empty.");
      continue;
    }

    String trimmedInput = input.trim();

    if (trimmedInput == "00") {
      return null;
    }

    double? value = double.tryParse(trimmedInput);

    if (value != null && !value.isNaN) {
      return value;
    } else {
      print("Error: '$trimmedInput' is not a valid number. Try again.");
    }
  }
}

double sum(double x, double y) => x + y;
double sub(double x, double y) => x - y;
double mul(double x, double y) => x * y;
double div(double x, double y) => x / y;

void main() {
  List result = [];
  print("simple calculator");
  print("enter the operation( / * - +)");
  String op = stdin.readLineSync()!.trim();
  while (true) {
    if (!["+", "-", "*", "/"].contains(op)) {
      print("enter a valid operation (/ * - + )");
      op = stdin.readLineSync()!.trim();
    } else {
      break;
    }
  }
  double? num1 = checknumber("enter the first number");
  double? num2 = checknumber("enter the second number");
  if (num1 == null || num2 == null) {
    print("exiting");
    return;
  }
  switch (op) {
    case "+":
      result.add(sum(num1, num2));
      break;
    case "-":
      result.add(sub(num1, num2));
      break;
    case "*":
      result.add(mul(num1, num2));
      break;
    case "/":
      {
        if (num2 == 0) {
          print("Error: Division by zero.");
          return;
        }
        result.add(div(num1, num2));
        break;
      }
  }
  print("result = ${result.last}");
  double? num3;
  print("choose the operation (/ * - +) or press 00 to stop ");

  String op2 = stdin.readLineSync()!.trim();
  while (true) {
    if (!["+", "-", "*", "/", "00"].contains(op2)) {
      print("enter a valid operation (/ * - + )");
      op2 = stdin.readLineSync()!.trim();
    } else {
      break;
    }
  }
  while (op2 != "00") {
    num3 = checknumber("enter the third number or enter 00 to stop");
    if (num3 == null) {
      print("exiting");
      break;
    }
    switch (op2) {
      case "+":
        result.add(sum(result.last, num3));
        break;
      case "-":
        result.add(sub(result.last, num3));
        break;
      case "*":
        result.add(mul(result.last, num3));
        break;
      case "/":
        {
          if (num3 == 0) {
            print("Error: Division by zero. enter another number");
            continue;
          }
          result.add(div(result.last, num3));
          break;
        }
    }
  }
  print(result.last);
}
