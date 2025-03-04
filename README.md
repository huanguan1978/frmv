Customizable form validator, including text input checks.

## Input controls: defining types and attributes.
Type：text, password, email, url, tel, phone, boolean, integer, float, float2dp, float4dp, date, time, datetime, jsonpair, other.  
Attr: text, require, type, maxlength, minlength, datalist, pattern, validation.  
Attr: maxnum, minnum (integer and float only)  
Attr: jsonkey (jsonpair only)  

## Input validation example: Email

Validation with regular expression
```dart
final pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
final regexpEmail = RegExp(pattern);
final email = 'abc@example.com';
final inputText = InputText(email, pattern: regexpEmail);
final inputError = inputText.validity(email);
if (inputError!=null) print(inputError.text(inputText));
```

Validation with custom function
```dart
bool isEmail(String email) {
  int p1 = email.indexOf('@');
  if (p1 == -1) return false;
  final p2 = email.indexOf('.', p1);
  return (p1 > 1 && p2 > p1++) ? true : false;
}

final email = 'abc@example.com';
final inputText = InputText(email, validation: isEmail);
final inputError = inputText.validity(email);
if (inputError!=null) print(inputError.text(inputText));
```

Validation with library predefined method
```dart
  final email = 'abc@example.com';
  /*
  final inputText = InputText(email);
  final inputEmail = EmailInput.dirty(inputText);
  final isValid = inputEmail.isValid;
  if (!isValid) print(${inputEmail.displayError!.text(inputText)});
  */
  // Single-line code
  final isValid = EmailInput.dirty(InputText(email)).isValid;
```

Validation with class attribute combination
```dart
  final email = 'adm@example.com';
  final whitelist = ['adm@example.com', 'webmaster@example.com'];
  // Single-line code, use attribute datalist instead
  final isValid = EmailInput.dirty(InputText(email, datalist:whitelist)).isValid;
```

## Library predefined method
```dart
bool isValid = False;
String text = 'text input text';

/// text input (max length 255)
isValid = TinyTextInput.dirty(InputText(text)).isValid;
/// text input (max length 65535, 2^8-1)
isValid = TextInput.dirty(InputText(text)).isValid;
/// text input (max length 16777215, 2^16-1)
isValid = MediumTextInput.dirty(InputText(text)).isValid;
/// text input (max length 4294967295, 2^32-1)
isValid = LongTextInput.dirty(InputText(text)).isValid;

text = '123';
/// unsigned int input (0~255)
isValid = TinyIntInput.dirty(InputText(text)).isValid;
/// unsigned int input (0~65536)
isValid = SmallIntInput.dirty(InputText(text)).isValid;
/// unsigned int input (0~16777215)
isValid = MediumIntInput.dirty(InputText(text)).isValid;
/// unsigned int input (0~4294967295)
isValid = IntInput.dirty(InputText(text)).isValid;
/// unsigned int input (0~9007199254740992)
isValid = BigIntInput.dirty(InputText(text)).isValid;

text = '{"firstname": "H", "lastname": "G"}';
/// json(k,v) text input (max length 65535, 2^8-1)
isValid = JsonPairInput.dirty(InputText(text)).isValid;
/// json(k,v) text input (max 16777215, 2^16-1)
isValid = MediumJsonPairInput.dirty(InputText(text)).isValid;

text = 'abc@example.com';
/// email input (max length 255)
isValid = EmailInput.dirty(InputText(text)).isValid;

text = 'https://pub.dev/publishers/iche2.com/packages';
/// url input (max length max length 65535, 2^8-1)
isValid = UrlInput.dirty(InputText(text)).isValid;
/// boolean input ( 0 or 1)
isValid = BooleanInput.dirty(InputText(text)).isValid;

/// secure password input
isValid = PasswordInput.dirty(InputText(text)).isValid;

text = '123456';
/// Six-digit integer input, verification code.
isValid = Int6CodeInput.dirty(InputText(text)).isValid;

text = '1741052091135819000';
/// 10-digit timestamp input (1970-01-01T00:00:00 ~ 2038-01-19T03:14:00)
isValid = TimeStamp10Input.dirty(InputText(text.substring(0,10))).isValid;
/// 13-digit timestamp input (1970-01-01T00:00:00 ~ 3001-01-01T00:00:00)
isValid = TimeStamp13Input.dirty(InputText(text.substring(0,13))).isValid;
/// 16-digit timestamp input (1970-01-01T00:00:00 ~ 3013-04-23T05:33:04)
isValid = TimeStamp13Input.dirty(InputText(text.substring(0,16))).isValid;
```


## Flutter TextFromField Validator
```dart
TextFormField(
  // The validator receives the text that the user has entered.
  validator: (value) {
    final email = value??'';
    final isNotValid =  EmailInput.dirty(InputText(email)).isNotValid;
    if (inNotValid) {
      return 'Please enter your email address';
    }
    return null;
  },
),
```

## From Validator
```dart
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

  final formData = formValidator.formData;
  print(formData);
```