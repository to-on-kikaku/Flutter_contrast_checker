import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:contrast_checker/contrast_checker.dart';

void main() {
  test('adds one to input values', () {
    final contrastChecker = ContrastChecker();
    expect(contrastChecker.contrastCheck(18.6, Color(0xFF6E6E6E), Color(0xFFFFFFFF), WCAG.AA), true);
    expect(contrastChecker.contrastCheck(18.6, Color(0xFF6E6E6E), Color(0xFFFFFFFF), WCAG.AA), false);

    expect(contrastChecker.contrastCheck(24, Color(0xFF6E6E6E), Color(0xFFFFFFFF), WCAG.AAA), true);
    expect(contrastChecker.contrastCheck(24, Color(0xFF6E6E6E), Color(0xFFFFFFFF), WCAG.AAA), true);
  });
}
