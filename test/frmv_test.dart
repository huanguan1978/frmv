import 'package:frmv/frmv.dart';
import 'package:test/test.dart';

void main() {
  group('password of tests', () {
    // final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('generate secure password Test', () {
      // expect(awesome.isAwesome, isTrue);
      expect(isPasswordSecure(generatePassword(8)), isTrue);
      expect(isPasswordSecure(generatePassword(8)), isTrue);
      expect(isPasswordSecure(generatePassword(8)), isTrue);
    });
  });
}
