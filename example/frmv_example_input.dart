import 'package:frmv/frmv.dart';

InputText inputEmailRule1(String email) {
  final patt =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
  final RegExp regexpEmail = RegExp(patt);
  return InputText(email,
      require: true, minlength: 5, maxlength: 255, pattern: regexpEmail);
}

InputText inputEmailRule2(String email) {
  isEmail(String email) {
    var p1 = email.indexOf('@');
    if (p1 == -1) return false;
    final p2 = email.indexOf('.', p1);
    return (p1 > 1 && p2 > p1++) ? true : false;
  }

  return InputText(email,
      require: true, minlength: 5, maxlength: 255, validation: isEmail);
}

void exampleInputEmail10() {
  final inputText = inputEmailRule1('');
  final inputEmail = EmailInput.pure(inputText);
  print(inputEmail.value.text);
  print(inputEmail.isValid);
  print(inputEmail.error);
  print(inputEmail.displayError?.text(inputText));
}

void exampleInputEmail11() {
  final inputText = inputEmailRule1('a@a');
  final inputEmail = EmailInput.dirty(inputText);
  print(inputEmail.value.text);
  print(inputEmail.isValid);
  print(inputEmail.error);
  print(inputEmail.displayError?.text(inputText));
}

void exampleInputEmail12() {
  final inputEmail = EmailInput.dirty(inputEmailRule1('abc@abc.com'));
  print(inputEmail.value.text);
  print(inputEmail.isValid);
  print(inputEmail.error);
  print(inputEmail.displayError);
}

void exampleInputEmail20() {
  final inputText = inputEmailRule1('');
  final inputEmail = EmailInput.pure(inputText);
  print(inputEmail.isValid);
  print(inputEmail.error);
  print(inputEmail.displayError?.text(inputText));
}

void exampleInputEmail21() {
  final inputText = inputEmailRule1('abc@abc');
  final inputEmail = EmailInput.dirty(inputText);
  print(inputEmail.value.text);
  print(inputEmail.isValid);
  print(inputEmail.error);
  print(inputEmail.displayError?.text(inputText));
}

void exampleInputEmail22() {
  final inputEmail = EmailInput.dirty(inputEmailRule2('abc.name@abc.com'));
  print(inputEmail.value.text);
  print(inputEmail.isValid);
  print(inputEmail.error);
  print(inputEmail.displayError);
}

void exampleInputBoolean10() {
  final inputText = InputText('');
  final inputBoolean = BooleanInput.pure(inputText);
  print(inputBoolean.value.text);
  print(inputBoolean.isValid);
  print(inputBoolean.error);
  print(inputBoolean.displayError);
}

void exampleInputBoolean11() {
  final inputText = InputText('a');
  final inputBoolean = BooleanInput.dirty(inputText);
  print(inputBoolean.value.text);
  print(inputBoolean.isValid);
  print(inputBoolean.error);
  print(inputBoolean.displayError);
  print(inputBoolean.displayError?.text(inputText));

  InputTextError inputError = inputBoolean.displayError as InputTextError;
  print(inputError.intlInputTextError(inputText));
}

void exampleInputBoolean12() {
  final inputText = InputText('0');
  final inputBoolean = BooleanInput.dirty(inputText);
  print(inputBoolean.value.text);
  print(inputBoolean.isValid);
  print(inputBoolean.error);
  print(inputBoolean.displayError);
  print(inputBoolean.displayError?.text(inputText));
}

void exampleInputBoolean13() {
  final inputText = InputText('1');
  final inputBoolean = BooleanInput.dirty(inputText);
  print(inputBoolean.value.text);
  print(inputBoolean.isValid);
  print(inputBoolean.error);
  print(inputBoolean.displayError);
  print(inputBoolean.displayError?.text(inputText));
}

void exampleInputInt6Code10() {
  final inputText = InputText('123456');
  final inputInt6Code = Int6CodeInput.dirty(inputText);
  print(inputInt6Code.value.text);
  print(inputInt6Code.isValid);

  print(inputInt6Code.error);
  print(inputInt6Code.displayError);
  print(inputInt6Code.displayError?.text(inputText));
  if (inputInt6Code.isNotValid) {
    InputTextError inputError = inputInt6Code.displayError as InputTextError;
    print(inputError.intlInputTextError(inputText));
  }
}

void exampleInputInt6Code11() {
  final inputText = InputText('a');
  final inputInt6Code = Int6CodeInput.dirty(inputText);
  print(inputInt6Code.value.text);
  print(inputInt6Code.isValid);
  print(inputInt6Code.error);
  print(inputInt6Code.displayError);
  print(inputInt6Code.displayError?.text(inputText));

  InputTextError inputError = inputInt6Code.displayError as InputTextError;
  print(inputError.intlInputTextError(inputText));
}

void exampleInputTinyText10() {
  final textAction = 'forgot';
  final tinyTextInput = TinyTextInput.dirty(
      InputText(textAction, datalist: ['signin', 'signup', 'forgot']));
  print(tinyTextInput.isValid);
  print(tinyTextInput.isNotValid);
  print(tinyTextInput.error);
}

void mainExampleInputEmail() {
  print('---exampleInputEmail10');
  exampleInputEmail10();
  print('---exampleInputEmail11');
  exampleInputEmail11();
  print('---exampleInputEmail12');
  exampleInputEmail12();

  print('---exampleInputEmail20');
  exampleInputEmail20();
  print('---exampleInputEmail21');
  exampleInputEmail21();
  print('---exampleInputEmail22');
  exampleInputEmail22();
}

void mainExampleInputBoolean() {
  print('---exampleInputBoolean10');
  exampleInputBoolean10();
  print('---exampleInputBoolean11');
  exampleInputBoolean11();
  print('---exampleInputBoolean12');
  exampleInputBoolean12();
  print('---exampleInputBoolean13');
  exampleInputBoolean13();
}

void mainExampleInputInt6Code() {
  print('---exampleInputInt6Code10');
  exampleInputInt6Code10();
  print('---exampleInputInt6Code11');
  exampleInputInt6Code11();
}

void main() {
  // mainExampleInputEmail();
  // mainExampleInputBoolean();
  //  mainExampleInputInt6Code();
  exampleInputTinyText10();
}
