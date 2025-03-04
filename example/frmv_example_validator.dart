import 'package:frmv/frmv.dart';

import 'package:intl/intl.dart';
import 'package:frmv/i10n/messages_all.dart';

void mainExampleFormValidator1() {
  final submitData = {'email': 'abc@abc.com', 'password': 'aB@12345'};
  Map<String, FormzInput> inputValidator = {};
  if (submitData case {'email': String email_, 'password': String password_}) {
    inputValidator['email'] = EmailInput.dirty(InputText(email_));
    inputValidator['password'] = PasswordInput.dirty(InputText(password_));
  }

  final formValidator = FormValidator(submitData, inputValidator);
  print('isValid:${formValidator.isValid}');
  print('formData:${formValidator.formData}');
  print('formError:${formValidator.formError}');
}

void mainExampleFormValidator2() {
  final submitData = {'email': 'abc#abc.com', 'password': 'aB@12345'};
  Map<String, FormzInput> inputValidator = {};
  if (submitData case {'email': String email_, 'password': String password_}) {
    inputValidator['email'] = EmailInput.dirty(InputText(email_));
    print(
        "inputValidator['email'].isValid:${inputValidator['email']!.isValid}");

    inputValidator['password'] = PasswordInput.dirty(InputText(password_));
    print(
        "inputValidator['password'].isValid:${inputValidator['password']!.isValid}");
  }

  final formValidator = FormValidator(submitData, inputValidator);
  print('isValid:${formValidator.isValid}');
  print('formData:${formValidator.formData}');
  print('formError:${formValidator.formError}');
  print('formIntlError:${formValidator.formIntlError}');
}

void mainExampleFormValidator3() {
  final submitData = {'email': 'crown.hg@gmail.com', 'action': 'forgot'};
  Map<String, FormzInput> inputValidator = {};
  if (submitData case {'email': String email_, 'action': String action_}) {
    inputValidator['email'] = EmailInput.dirty(InputText(email_));
    print(
        "inputValidator['email'].isValid:${inputValidator['email']!.isValid}");

    final actions = [submitData['action']!];
    inputValidator['action'] =
        TinyTextInput.dirty(InputText(action_, datalist: actions));
    print(
        "inputValidator['action'].isValid:${inputValidator['action']!.isValid}");
  }

  final formValidator = FormValidator(submitData, inputValidator);
  print('isValid:${formValidator.isValid}');
  print('isNotValid:${formValidator.isNotValid}');
  print('formData:${formValidator.formData}');
  print('formError:${formValidator.formError}');
  print('formIntlError:${formValidator.formIntlError}');
}

void mainIntl() {
  Intl.defaultLocale = 'zh_CN';
  initializeMessages(Intl.defaultLocale).then((intl) {
    mainExampleFormValidator2();
  });
}

void main() {
  // mainExampleFormValidator1();
  // mainExampleFormValidator2();
  mainExampleFormValidator3();
//  mainIntl();
}
