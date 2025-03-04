part of '../frmv.dart';

enum InputTypeName {
  text,
  password,
  email,
  url,
  tel,
  phone,
  boolean,
  integer,
  float,
  float2dp,
  float4dp,
  date,
  time,
  datetime,
  jsonpair,
  other
}

enum InputTextError {
  invalid,
  empty,
  none,
  maxlength,
  minlength,
  maxnum,
  minnum,
  datalist,
  jsonkey,
  pattern,
  validation
}

/// Text Input Control
///
/// Attributes：text, require, type, maxlength, minlength, datalist, pattern, validation
/// Attributes: maxnum, minnum (integer and float only)
/// Attributes: jsonkey (jsonpair only)

class InputText {
  InputText(
    this.text, {
    this.require = true,
    this.type,
    this.maxlength,
    this.minlength,
    this.maxnum,
    this.minnum,
    this.datalist,
    this.jsonkey,
    this.pattern,
    this.validation,
  });

  late int? maxlength;
  late int? minlength;
  late InputTypeName? type;
  late num? maxnum;
  late num? minnum;

  final RegExp? pattern;
  final String text;
  final bool require;

  late List<String>? datalist;
  late List<String>? jsonkey;
  late bool Function(String text)? validation;

  InputTextError? validity(String text) {
    if (type.runtimeType == Null) {
      type = InputTypeName.text;
    }
    if (require) {
      if (text.runtimeType == Null) {
        return InputTextError.none;
      }
      if (text.isEmpty) {
        return InputTextError.empty;
      }
    }
    if (text.isNotEmpty) {
      if (maxlength case int maxlength_) {
        if (text.length > maxlength_) {
          return InputTextError.maxlength;
        }
      }
      if (minlength case int minlength_) {
        if (text.length < minlength_) {
          return InputTextError.minlength;
        }
      }

      /// jsonpair
      if (type == InputTypeName.jsonpair) {
        if (!sv_.isJson(text)) {
          return InputTextError.invalid;
        } else {
          if (jsonkey case List<String> jsonkey_) {
            final jdat = jsonDecode(text) as Map<String, dynamic>;
            final jkey = jdat.keys;
            var notexistkey = false;
            for (var key_ in jsonkey_) {
              if (!jkey.contains(key_)) {
                notexistkey = true;
                break;
              }
            }
            if (notexistkey) {
              return InputTextError.jsonkey;
            }
          }
        }
      }

      /// number
      if (type == InputTypeName.integer || type == InputTypeName.float) {
        if (!sv_.isNumeric(text)) {
          return InputTextError.invalid;
        }
        if (type == InputTypeName.integer) {
          if (maxnum.runtimeType != Null && (sv_.toInt(text) > maxnum!)) {
            return InputTextError.maxnum;
          }
          if (minnum.runtimeType != Null && (sv_.toInt(text) < minnum!)) {
            return InputTextError.minnum;
          }
        }
        if (type == InputTypeName.float) {
          if (maxnum.runtimeType != Null && (sv_.toFloat(text) > maxnum!)) {
            return InputTextError.maxnum;
          }
          if (minnum.runtimeType != Null && (sv_.toFloat(text) < minnum!)) {
            return InputTextError.minnum;
          }
        }
      }

      if (datalist case List<String> datalist_) {
        if (datalist_.isNotEmpty && !datalist_.contains(text)) {
          return InputTextError.datalist;
        }
      }
      if (pattern case RegExp pattern_) {
        if (!pattern_.hasMatch(text)) {
          return InputTextError.pattern;
        }
      }
      if (validation case bool Function(String) validation_) {
        if (!validation_(text)) {
          return InputTextError.validation;
        }
      }
    }

    return null;
  }
}

extension InputTypeNameExtension on InputTypeName {
  String text() {
    switch (this) {
      case InputTypeName.password:
        return 'input password';
      case InputTypeName.email:
        return 'input email';
      case InputTypeName.url:
        return 'input url';
      case InputTypeName.tel:
        return 'input tel';
      case InputTypeName.phone:
        return 'input phone';
      case InputTypeName.boolean:
        return 'input boolean';
      case InputTypeName.integer:
        return 'input integer';
      case InputTypeName.float:
        return 'input float';
      case InputTypeName.float2dp:
        return 'input Two Decimal Places';
      case InputTypeName.float4dp:
        return 'input Four Decimal Places';
      case InputTypeName.date:
        return 'input date';
      case InputTypeName.time:
        return 'input time';
      case InputTypeName.datetime:
        return 'input datetime';
      case InputTypeName.jsonpair:
        return 'input jsonpair';
      case InputTypeName.other:
        return 'input other';
      default:
        return 'input text';
    }
  }

  String intlInputTypeName(InputTypeName inputTypeName) => Intl.select(
        inputTypeName,
        {
          InputTypeName.text: 'input text',
          InputTypeName.password: 'input password',
          InputTypeName.email: 'input email',
          InputTypeName.url: 'input url',
          InputTypeName.tel: 'input tel',
          InputTypeName.boolean: 'input boolean',
          InputTypeName.integer: 'input integer',
          InputTypeName.float: 'input float',
          InputTypeName.float2dp: 'input Two Decimal Places',
          InputTypeName.float4dp: 'input Four Decimal Places',
          InputTypeName.date: 'input date',
          InputTypeName.time: 'input time',
          InputTypeName.datetime: 'input datetime',
          InputTypeName.jsonpair: 'input jsonpair',
          InputTypeName.other: 'input other',
        },
        name: 'intlInputTypeName',
        args: [inputTypeName],
        desc: 'intltext inputType',
      );
}

extension InputTextErrorExtension on InputTextError {
  String text(InputText inputText) {
    switch (this) {
      case InputTextError.invalid:
        return '${inputText.type} err:invalid';
      case InputTextError.empty:
        return '${inputText.type} err:empty';
      case InputTextError.none:
        return '${inputText.type} err:none';
      case InputTextError.maxlength:
        return '${inputText.type} err:maxlength(${inputText.maxlength})';
      case InputTextError.minlength:
        return '${inputText.type} err:minlength(${inputText.minlength})';
      case InputTextError.maxnum:
        return '${inputText.type} err:maxnum(${inputText.maxnum})';
      case InputTextError.minnum:
        return '${inputText.type} err:minnum(${inputText.minnum})';
      case InputTextError.datalist:
        return '${inputText.type} err:datalist(${inputText.datalist?.join(',')})';
      case InputTextError.jsonkey:
        return '${inputText.type} err:jsonkey(${inputText.jsonkey?.join(',')})';
      case InputTextError.pattern:
        return '${inputText.type} err:pattern not match';
      case InputTextError.validation:
        return '${inputText.type} err:validation failure';
    }
  }

  String intlInputTextError(InputText inputText) {
    final InputTypeName inputTypeName = inputText.type!;
    final String intlInputTypeName =
        inputTypeName.intlInputTypeName(inputTypeName);

    switch (this) {
      case InputTextError.invalid:
        return intlInputTextErrorInvalid(intlInputTypeName);
      case InputTextError.empty:
        return intlInputTextErrorEmpty(intlInputTypeName);
      case InputTextError.none:
        return intlInputTextErrorNone(intlInputTypeName);
      case InputTextError.maxlength:
        return intlInputTextErrorMaxLength(
            intlInputTypeName, inputText.maxlength as int);
      case InputTextError.minlength:
        return intlInputTextErrorMinLength(
            intlInputTypeName, inputText.minlength as int);
      case InputTextError.maxnum:
        return intlInputTextErrorMaxNum(
            intlInputTypeName, inputText.maxnum as num);
      case InputTextError.minnum:
        return intlInputTextErrorMinNum(
            intlInputTypeName, inputText.minnum as num);
      case InputTextError.datalist:
        return intlInputTextErrorDataList(
            intlInputTypeName, inputText.datalist!.join(','));
      case InputTextError.jsonkey:
        return intlInputTextErrorJsonKey(
            intlInputTypeName, inputText.jsonkey!.join(','));

      case InputTextError.pattern:
        return intlInputTextErrorPattern(intlInputTypeName);
      case InputTextError.validation:
        return intlInputTextErrorValidation(intlInputTypeName);
    }
  }

  String intlInputTextErrorInvalid(String intlInputTypeName) {
    return Intl.message(
      '$intlInputTypeName err:Invalid',
      name: 'intlInputTextErrorInvalid',
      args: [intlInputTypeName],
    );
  }

  String intlInputTextErrorEmpty(String intlInputTypeName) {
    return Intl.message(
      '$intlInputTypeName err:Empty',
      name: 'intlInputTextErrorEmpty',
      args: [intlInputTypeName],
    );
  }

  String intlInputTextErrorNone(String intlInputTypeName) {
    return Intl.message(
      '$intlInputTypeName err:None',
      name: 'intlInputTextErrorNone',
      args: [intlInputTypeName],
    );
  }

  String intlInputTextErrorMaxLength(String intlInputTypeName, int maxlength) {
    return Intl.message(
      '$intlInputTypeName err:maxlength($maxlength)',
      name: 'intlInputTextErrorMaxLength',
      args: [intlInputTypeName, maxlength],
    );
  }

  String intlInputTextErrorMinLength(String intlInputTypeName, int minlength) {
    return Intl.message(
      '$intlInputTypeName err:minlength($minlength)',
      name: 'intlInputTextErrorMinLength',
      args: [intlInputTypeName, minlength],
    );
  }

  String intlInputTextErrorMaxNum(String intlInputTypeName, num maxnum) {
    return Intl.message(
      '$intlInputTypeName err:maxnum($maxnum)',
      name: 'intlInputTextErrorMaxNum',
      args: [intlInputTypeName, maxnum],
    );
  }

  String intlInputTextErrorMinNum(String intlInputTypeName, num minnum) {
    return Intl.message(
      '$intlInputTypeName err:minnum($minnum)',
      name: 'intlInputTextErrorMinNum',
      args: [intlInputTypeName, minnum],
    );
  }

  String intlInputTextErrorDataList(
      String intlInputTypeName, String datalists) {
    return Intl.message(
      '$intlInputTypeName err:indatalist($datalists)',
      name: 'intlInputTextErrorDataList',
      args: [intlInputTypeName, datalists],
    );
  }

  String intlInputTextErrorJsonKey(String intlInputTypeName, String jsonkeys) {
    return Intl.message(
      '$intlInputTypeName err:jsonkey($jsonkeys)',
      name: 'intlInputTextErrorJsonKey',
      args: [intlInputTypeName, jsonkeys],
    );
  }

  String intlInputTextErrorPattern(String intlInputTypeName) {
    return Intl.message(
      '$intlInputTypeName err:pattern not match',
      name: 'intlInputTextErrorPattern',
      args: [intlInputTypeName],
    );
  }

  String intlInputTextErrorValidation(String intlInputTypeName) {
    return Intl.message(
      '$intlInputTypeName err:validation failure',
      name: 'intlInputTextErrorValidation',
      args: [intlInputTypeName],
    );
  }
}
