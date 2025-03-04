import 'package:frmv/frmv.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:frmv/i10n/messages_all.dart';

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

void mainExampleInputBoolean() {
  print('---exampleInputBoolean11');
  exampleInputBoolean11();
}

void main() {
  Intl.defaultLocale = 'zh_CN';
  initializeMessages(Intl.defaultLocale).then((intl) {
    mainExampleInputBoolean();
  });
  mainExampleInputBoolean();
}
