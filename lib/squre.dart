import 'dart:math' as math;

sealed class Shape {}

class Square implements Shape {
  final double length;

  Square(this.length);
}

class Circle implements Shape {
  final double radius;

  Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {
      Square(length: double l) => l * l,
      Circle(radius: double r) => r * r * math.pi
    };

main() {
  print('Area of Square(5); ${calculateArea(Square(5))}');
}
