part of '../frmv.dart';

class FormValidator with FormzMixin {
  FormValidator(this.submitData, this.inputValidator);

  final Map<String, String> submitData;
  final Map<String, FormzInput> inputValidator;

  @override
  List<FormzInput> get inputs => inputValidator.values.toList();

  /// displayError
  Map<String, String> get formError {
    Map<String, String> err = {};
    inputValidator.forEach((name, validator) {
      if (validator.isNotValid) {
        InputText input = validator.value;
        InputTextError error = validator.displayError;
        err[name] = error.text(input);
      }
    });
    return err;
  }

  /// displayError, intl
  Map<String, String> get formIntlError {
    Map<String, String> err = {};
    inputValidator.forEach((name, validator) {
      if (validator.isNotValid) {
        InputText input = validator.value;
        InputTextError error = validator.displayError;
        err[name] = error.intlInputTextError(input);
      }
    });
    return err;
  }

  Map<String, String> get formData {
    Map<String, String> data = {};
    inputValidator.forEach((name, validator) {
      if (validator.isValid) {
        InputText input = validator.value;
        data[name] = input.text;
      }
    });
    return data;
  }
}
