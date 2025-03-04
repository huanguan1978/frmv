// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'en_US';

  static m0(intlInputTypeName, datalists) => "${intlInputTypeName} err:indatalist(${datalists})";

  static m1(intlInputTypeName) => "${intlInputTypeName} err:Empty";

  static m2(intlInputTypeName) => "${intlInputTypeName} err:Invalid";

  static m3(intlInputTypeName, jsonkeys) => "${intlInputTypeName} err:injsonkey(${jsonkeys})";

  static m4(intlInputTypeName, maxlength) => "${intlInputTypeName} err:maxlength(${maxlength})";

  static m5(intlInputTypeName, maxnum) => "${intlInputTypeName} err:maxnum(${maxnum})";

  static m6(intlInputTypeName, minlength) => "${intlInputTypeName} err:minlength(${minlength})";

  static m7(intlInputTypeName, minnum) => "${intlInputTypeName} err:minnum(${minnum})";

  static m8(intlInputTypeName) => "${intlInputTypeName} err:None";

  static m9(intlInputTypeName) => "${intlInputTypeName} err:pattern not match";

  static m10(intlInputTypeName) => "${intlInputTypeName} err:validation failure";

  static m11(inputTypeName) => Intl.select(inputTypeName, {'text': 'input text', 'password': 'input password', 'email': 'input email', 'url': 'input url', 'tel': 'input tel', 'boolean': 'input boolean', 'integer': 'input integer', 'float': 'input float', 'float2dp': 'input Two Decimal Places', 'float4dp': 'input Four Decimal Places', 'date': 'input date', 'time': 'input time', 'datetime': 'input datetime', 'other': 'input other', });

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'intlInputTextErrorDataList': m0,
    'intlInputTextErrorEmpty': m1,
    'intlInputTextErrorInvalid': m2,
    'intlInputTextErrorJsonKey': m3,
    'intlInputTextErrorMaxLength': m4,
    'intlInputTextErrorMaxNum': m5,
    'intlInputTextErrorMinLength': m6,
    'intlInputTextErrorMinNum': m7,
    'intlInputTextErrorNone': m8,
    'intlInputTextErrorPattern': m9,
    'intlInputTextErrorValidation': m10,
    'intlInputTypeName': m11
  };
}
