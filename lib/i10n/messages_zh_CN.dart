// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
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

typedef String? MessageIfAbsent(String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'zh_CN';

  static m0(intlInputTypeName, datalists) =>
      "${intlInputTypeName} 错误信息:可选数据列表(${datalists})";

  static m1(intlInputTypeName) => "${intlInputTypeName} 错误信息:数据为空";

  static m2(intlInputTypeName) => "${intlInputTypeName} 错误信息:无效数据";

  static m3(intlInputTypeName, jsonkeys) =>
      "${intlInputTypeName} 错误信息:必需存在JsonKey鍵名清单(${jsonkeys})";

  static m4(intlInputTypeName, maxlength) =>
      "${intlInputTypeName} 错误信息:文本限长最长(${maxlength})";

  static m5(intlInputTypeName, maxnum) =>
      "${intlInputTypeName} 错误信息:数字区间最大(${maxnum})";

  static m6(intlInputTypeName, minlength) =>
      "${intlInputTypeName} 错误信息:文本限长最短(${minlength})";

  static m7(intlInputTypeName, minnum) =>
      "${intlInputTypeName} 错误信息:数字区间最小(${minnum})";

  static m8(intlInputTypeName) => "${intlInputTypeName} 错误信息:数据NULL";

  static m9(intlInputTypeName) => "${intlInputTypeName} 错误信息:正则表达式不匹配";

  static m10(intlInputTypeName) => "${intlInputTypeName} 错误信息:函数校验不通过";

  static m11(inputTypeName) => Intl.select(inputTypeName, {
        'text': '文本输入',
        'password': '密码输入',
        'email': '电子邮箱输入',
        'url': '网址输入',
        'tel': '电话号码输入',
        'boolean': '布尔输入',
        'integer': '整数输入',
        'float': '小数输入',
        'float2dp': '保留两位小数输入',
        'float4dp': '保留四位小数输入',
        'date': '日期输入',
        'time': '时间输入',
        'datetime': '日期时间输入',
        'other': '其他输入',
      });

  @override
  final Map<String, dynamic> messages =
      _notInlinedMessages(_notInlinedMessages);

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
