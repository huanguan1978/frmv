part of '../frmv.dart';

/// boolean check
///
/// validate a character as a boolean ('0' or '1')
///```dart
/// print(isBoolean('0')); // true
/// print(isBoolean('1')); // true
/// print(isBoolean('')); // false
/// print(isBoolean('a')); // false
///```
bool isBoolean(String value) {
  const pattern = r'^[0|1]$';
  final regexBoolean = RegExp(pattern);
  return regexBoolean.hasMatch(value);
}

/// secure password check
///
/// the password must be eight characters and contain at least one uppercase character, at least one lowercase character and at least one number and at least one punctuation (!@#\$&*~).
///
///```dart
/// isPasswordSecure('Vignesh123!'); // true
/// isPasswordSecure('vignesh123'); // false
/// isPasswordSecure('VIGNESH123!'); // false
/// isPasswordSecure('vignesh@'); // false
/// isPasswordSecure('12345678?'); // false
///```
bool isPasswordSecure(String password) {
  const pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  final regexPassword = RegExp(pattern);
  return regexPassword.hasMatch(password);
}

/// generates a unique integer ID
///
/// 16-digit: microsecond timestamp (13 digits) + 3 random digits
///
///```dart
/// genUniqueId(); // 1711683012336321
/// genUniqueId(); // 1711683012336987
///```
String genUniqueId() {
  final randInt = Random.secure().nextInt(999);
  final msts = DateTime.timestamp().microsecondsSinceEpoch + randInt;
  return msts.toString();
}

/// generates a strong, random password
///
/// the password must be eight characters and contain at least one uppercase character, at least one lowercase character and at least one number and at least one punctuation (!@#\$&*~).
///```dart
/// generatePassword(8); // C1$yRz!Y
///```
String generatePassword(int length) {
  const lowercase = 'abcdefghijklmnopqrstuvwxyz';
  const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const numbers = '0123456789';
  const symbols = '!@#\$&*~'; // '!@#%^&*()_+-=[]{}|;:<>,.?/~';

  final lowerChars = lowercase.split('');
  final upperChars = uppercase.split('');
  final numberChars = numbers.split('');
  final symbolChars = symbols.split('');

  var passwdChars = <String>[];
  passwdChars.add((lowerChars..shuffle()).first);
  passwdChars.add((upperChars..shuffle()).first);
  passwdChars.add((numberChars..shuffle()).first);
  passwdChars.add((symbolChars..shuffle()).first);

  final allChars = [
    ...lowerChars,
    ...upperChars,
    ...numberChars,
    ...symbolChars
  ];

  final random = Random.secure();
  allChars.shuffle(random);
  passwdChars.addAll(allChars.getRange(0, length - 4));
  passwdChars.shuffle(random);

  return passwdChars.join();
}

/// strip html tags
///
///```dart
/// htmlStripTags('<h1>hi</h1>'); // hi
///```
String htmStripTags(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ').trim();
}

/// escape html unsafe characters
///
///```dart
/// htmEscape('Text & subject'); // Text &amp; subject
/// htmEscape('10 > 1 and 1 < 10'); // 10 &gt; 1 and 1 &lt; 10
/// htmEscape("Single-quoted: 'text'"); //  Single-quoted: &#39;text&#39;
/// htmEscape('Double-quoted: "text"'); //  Double-quoted: &quot;text&quot;
/// htmEscape('Path: /system/'); // Path: &#47;system&#47;
///```
String htmEscape(String text) {
  return htmlEscape.convert(text);
}
