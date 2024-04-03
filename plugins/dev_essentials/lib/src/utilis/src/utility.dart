part of '../utils.dart';

class DevEssentialUtility {
  DevEssentialUtility._();

  static RegExp alphaNumericPasswordRegex =
      RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$");

  static RegExp phoneRegex =
      RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');



  static bool? isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty as bool?;
    }
    return false;
  }

  static bool isCaseInsensitiveContains(String a, String b) {
    return a.toLowerCase().contains(b.toLowerCase());
  }

  static bool isCaseInsensitiveContainsAny(String a, String b) {
    final lowA = a.toLowerCase();
    final lowB = b.toLowerCase();

    return lowA.contains(lowB) || lowB.contains(lowA);
  }



  static bool? isBlank(dynamic value) {
    return isEmpty(value);
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isWord(String filePath) {
    const List<String> wordExtensions = <String>[
      'doc',
      'docx',
      'dot',
      'dotx',
      'rtf',
      'odt',
      'ott',
      'wps',
      'wpt',
    ];

    final ext = Dev.extension(filePath).toLowerCase().replaceAll('.', '');

    return wordExtensions.contains(ext);
  }

  static bool isExcel(String filePath) {
    const List<String> excelExtensions = <String>[
      'xls',
      'xlsx',
      'xlsb',
      'csv',
    ];

    final ext = Dev.extension(filePath).toLowerCase().replaceAll('.', '');

    return excelExtensions.contains(ext);
  }

  static bool isPPT(String filePath) {
    const List<String> pptExtensions = [
      'ppt',
      'pptx',
      'pps',
      'ppsx',
    ];

    final ext = Dev.extension(filePath).toLowerCase().replaceAll('.', '');

    return pptExtensions.contains(ext);
  }

  static bool isAPK(String filePath) =>
      Dev.extension(filePath).toLowerCase() == '.apk';

  static bool isPDF(String filePath) =>
      Dev.extension(filePath).toLowerCase() == '.pdf';

  static bool isHTML(String filePath) {
    const List<String> htmlExtensions = <String>[
      'html',
      'htm',
    ];

    final ext = Dev.extension(filePath).toLowerCase().replaceAll('.', '');

    return htmlExtensions.contains(ext);
  }

  static bool isURL(String s) => hasMatch(s,
      r'^(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})');

  static bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, phoneRegex.pattern);
  }

  static bool isDateTime(String s) =>
      hasMatch(s, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');

  static bool isMD5(String s) => hasMatch(s, r'^[a-f0-9]{32}$');

  static bool isSHA1(String s) =>
      hasMatch(s, r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})');

  static bool isSHA256(String s) =>
      hasMatch(s, r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}');

  static bool isSSN(String s) => hasMatch(s,
      r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$');

  static bool isBinary(String s) => hasMatch(s, r'^[0-1]+$');

  static bool isIPv4(String s) =>
      hasMatch(s, r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  static bool isIPv6(String s) => hasMatch(s,
      r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$');

  static bool isHexadecimal(String s) =>
      hasMatch(s, r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  static bool isPalindrom(String string) {
    final cleanString = string
        .toLowerCase()
        .replaceAll(RegExp(r"\s+"), '')
        .replaceAll(RegExp(r"[^0-9a-zA-Z]+"), "");

    for (var i = 0; i < cleanString.length; i++) {
      if (cleanString[i] != cleanString[cleanString.length - i - 1]) {
        return false;
      }
    }

    return true;
  }

  static bool isPassport(String s) =>
      hasMatch(s, r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  static bool isCurrency(String s) => hasMatch(s,
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  static double clampDouble(double x, double min, double max) {
    assert(min <= max && !max.isNaN && !min.isNaN);
    if (x < min) {
      return min;
    }
    if (x > max) {
      return max;
    }
    if (x.isNaN) {
      return max;
    }
    return x;
  }

  static Color getRandomColor() {
    Random random = Random();
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);

    return Color.fromRGBO(red, green, blue, 1.0);
  }
}
