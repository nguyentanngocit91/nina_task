import 'package:flutter/material.dart';

class L10n {
  // các ngôn ngữ hỗ trợ
  static final all = [
    const Locale('vi'),
    const Locale('en'),
  ];

  // lấy lá cờ theo ngôn ngữ
  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'vi':
      default:
        return '🇻🇳';
    }
  }
}
