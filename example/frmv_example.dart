import 'dart:io';

import 'package:frmv/frmv.dart';

bool emailInput1() {
  final pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final regexpEmail = RegExp(pattern);
  final email = 'abc@example.com';
  final inputText = InputText(email, pattern: regexpEmail);
  final inputError = inputText.validity(email);

  if (inputError == null) return true;
  print('emailInput1 error: ${inputError.text(inputText)}');
  return false;
}

bool emailInput2() {
  bool isEmail(String email) {
    int p1 = email.indexOf('@');
    if (p1 == -1) return false;
    final p2 = email.indexOf('.', p1);
    return (p1 > 1 && p2 > p1++) ? true : false;
  }

  final email = 'abc@example.com';
  final inputText = InputText(email, validation: isEmail);
  final inputError = inputText.validity(email);

  if (inputError == null) return true;
  print('emailInput2 error: ${inputError.text(inputText)}');
  return false;
}

bool emailInput3() {
  final email = 'abc@example.com';
  final inputText = InputText(email);
  final inputEmail = EmailInput.dirty(inputText);
  final isValid = inputEmail.isValid;
  if (!isValid) {
    print('emailInput3 error: ${inputEmail.displayError!.text(inputText)}');
  }
  return isValid;
}

bool emailInput4() {
  final email = 'abc@example.com';
  final whitelist = ['adm@example.com', 'webmaster@example.com'];
  final inputText = InputText(email, datalist: whitelist);
  final inputEmail = EmailInput.dirty(inputText);
  final isValid = inputEmail.isValid;
  if (!isValid) {
    print('emailInput4 error: ${inputEmail.displayError!.text(inputText)}');
  }
  return isValid;
}

bool formSubmit() {
  final submitData = {'email': 'abc@example.com', 'password': 'aB@12345'};

  Map<String, FormzInput> inputValidator = {};
  if (submitData case {'email': String email_, 'password': String password_}) {
    inputValidator['email'] = EmailInput.dirty(InputText(email_));
    inputValidator['password'] = PasswordInput.dirty(InputText(password_));
  }

  if (inputValidator.isEmpty) {
    print('bad request, required fields ${submitData.keys.join(', ')}');
    exit(1);
  }

  final formValidator = FormValidator(submitData, inputValidator);
  final isValid = formValidator.isValid;
  if (!isValid) {
    print('bad request, input error ${formValidator.formError}');
    exit(1);
  }

  // ignore: unused_local_variable
  final formData = formValidator.formData;
  // print(formData);
  return isValid;
}

void main() {
  emailInput1();
  emailInput2();
  emailInput3();
  emailInput4();
  formSubmit();
}
