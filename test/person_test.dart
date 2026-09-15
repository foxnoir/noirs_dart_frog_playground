import 'package:noirs_flutter_frog_playground/person.dart';
import 'package:test/test.dart';

void main() {
  test('people with the same name and age are equal', () {
    const bob = Person(name: 'Bob', age: 30);
    const alsoBob = Person(name: 'Bob', age: 30);

    expect(bob, equals(alsoBob));
  });
}
