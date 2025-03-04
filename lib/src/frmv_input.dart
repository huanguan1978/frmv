part of '../frmv.dart';

/// text input (max length 255)
class TinyTextInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  TinyTextInput.pure(super.value) : super.pure();
  TinyTextInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.text;
    value.maxlength = 255;
    return value.validity(value.text);
  }
}

/// text input (max length 65535, 2^8-1)
class TextInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  TextInput.pure(super.value) : super.pure();
  TextInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.text;
    value.maxlength = 65535;
    return value.validity(value.text);
  }
}

/// text input (max length 16777215, 2^16-1)
class MediumTextInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  MediumTextInput.pure(super.value) : super.pure();
  MediumTextInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.text;
    value.maxlength = 16777215;
    return value.validity(value.text);
  }
}

/// text input (max length 4294967295, 2^32-1)
class LongTextInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  LongTextInput.pure(super.value) : super.pure();
  LongTextInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.text;
    value.maxlength = 4294967295;
    return value.validity(value.text);
  }
}

/// unsigned int input (0~255)
class TinyIntInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  TinyIntInput.pure(super.value) : super.pure();
  TinyIntInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.integer;
    value.maxlength = 3;
    value.minlength = 1;
    value.maxnum = 255;
    value.minnum = 0;
    return value.validity(value.text);
  }
}

/// unsigned int input (0~65536)
class SmallIntInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  SmallIntInput.pure(super.value) : super.pure();
  SmallIntInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.integer;
    value.maxlength = 5;
    value.minlength = 1;
    value.maxnum = 65536;
    value.minnum = 0;
    return value.validity(value.text);
  }
}

/// unsigned int input (0~16777215)
class MediumIntInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  MediumIntInput.pure(super.value) : super.pure();
  MediumIntInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.integer;
    value.maxlength = 8;
    value.minlength = 1;
    value.maxnum = 16777215;
    value.minnum = 0;
    return value.validity(value.text);
  }
}

/// unsigned int input (0~4294967295)
class IntInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  IntInput.pure(super.value) : super.pure();
  IntInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.integer;
    value.maxlength = 10;
    value.minlength = 1;
    value.maxnum = 4294967295;
    value.minnum = 0;
    return value.validity(value.text);
  }
}

/// unsigned big int input (0~9007199254740992)
class BigIntInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  BigIntInput.pure(super.value) : super.pure();
  BigIntInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.integer;
    value.maxlength = 16;
    value.minlength = 1;
    // value.maxnum = 9223372036854775807; // dart maxint
    value.maxnum = 9007199254740992; // javascript maxint
    value.minnum = 0;
    return value.validity(value.text);
  }
}

/// json(k,v) text input (max length 65535, 2^8-1)
class JsonPairInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  JsonPairInput.pure(super.value) : super.pure();
  JsonPairInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.jsonpair;
    value.maxlength = 65535;
    return value.validity(value.text);
  }
}

/// json(k,v) text input (max length 16777215, 2^16-1)
class MediumJsonPairInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  MediumJsonPairInput.pure(super.value) : super.pure();
  MediumJsonPairInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.jsonpair;
    value.maxlength = 16777215;
    return value.validity(value.text);
  }
}

/// email input (max length 255)
class EmailInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  EmailInput.pure(super.value) : super.pure();
  EmailInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.email;
    value.maxlength = 255;
    value.validation = sv_.isEmail;
    return value.validity(value.text);
  }
}

/// secure password input
class PasswordInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  PasswordInput.pure(super.value) : super.pure();
  PasswordInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    if (value.maxlength.runtimeType == Null) {
      value.maxlength = 255;
    }
    if (value.minlength.runtimeType == Null) {
      value.minlength = 6;
    }
    value.type = InputTypeName.password;
    value.validation = isPasswordSecure;
    return value.validity(value.text);
  }
}

/// url input (max length max length 65535, 2^8-1)
class UrlInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  UrlInput.pure(super.value) : super.pure();
  UrlInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.url;
    value.minlength = 8;
    value.maxlength = 65535;
    value.validation = sv_.isURL;
    return value.validity(value.text);
  }
}

/// boolean input ( 0 or 1)
class BooleanInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  BooleanInput.pure(super.value) : super.pure();
  BooleanInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.boolean;
    value.datalist = [
      '0',
      '1',
    ];
    return value.validity(value.text);
  }
}

/// Six-digit integer input
class Int6CodeInput extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  Int6CodeInput.pure(super.value) : super.pure();
  Int6CodeInput.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    if (value.type.runtimeType == Null) {
      value.type = InputTypeName.integer;
    }
    if (value.maxlength.runtimeType == Null) {
      value.maxlength = 6;
    }
    if (value.minlength.runtimeType == Null) {
      value.minlength = 6;
    }
    if (value.maxnum.runtimeType == Null) {
      value.maxnum = 999999;
    }
    if (value.minnum.runtimeType == Null) {
      value.minnum = 1;
    }

    return value.validity(value.text);
  }
}

/// 10-digit timestamp input (1970-01-01T00:00:00 ~ 2038-01-19T03:14:00)
class TimeStamp10Input extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  TimeStamp10Input.pure(super.value) : super.pure();
  TimeStamp10Input.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.integer;
    value.maxlength = 10;
    value.minlength = 10;
    value.maxnum = 2147483647;
    value.minnum = 0;
    return value.validity(value.text);
  }
}

/// 13-digit timestamp input (1970-01-01T00:00:00 ~ 3001-01-01T00:00:00)
class TimeStamp13Input extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  TimeStamp13Input.pure(super.value) : super.pure();
  TimeStamp13Input.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.integer;
    value.maxlength = 13;
    value.minlength = 13;
    value.maxnum = 9999999999999;
    value.minnum = 0;
    return value.validity(value.text);
  }
}

/// 16-digit timestamp input (1970-01-01T00:00:00 ~ 3013-04-23T05:33:04)
class TimeStamp16Input extends FormzInput<InputText, InputTextError>
    with FormzInputErrorCacheMixin {
  TimeStamp16Input.pure(super.value) : super.pure();
  TimeStamp16Input.dirty(super.value) : super.dirty();

  @override
  InputTextError? validator(value) {
    value.type = InputTypeName.integer;
    value.maxlength = 16;
    value.minlength = 16;
    value.maxnum = 9007199254740992; // javascript maxint
    value.minnum = 0;
    return value.validity(value.text);
  }
}
