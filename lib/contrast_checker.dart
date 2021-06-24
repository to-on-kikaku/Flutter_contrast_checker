library contrast_checker;

import 'dart:math';
import 'dart:ui';

enum WCAG { AA, AAA }

class ContrastChecker {
  bool contrastCheck(
      double fontSize, Color textColor, Color backgroundColor, WCAG wcag) {
    bool isContrast = false;

    /// Returns a brightness value between 0 for darkest and 1 for lightest.
    /// for both colors textColor and backgroundColor
    ///
    /// Represents the relative luminance of the color. This value is computationally
    /// expensive to calculate.
    ///
    /// See <https://en.wikipedia.org/wiki/Relative_luminance>.
    var lum1 = textColor.computeLuminance();
    var lum2 = backgroundColor.computeLuminance();

    /// [brightest] is the relative luminance of the lighter of the foreground
    /// or background colors, and
    ///
    /// [darkest] is the relative luminance of the darker of the foreground
    /// or background colors.
    var brightest = max(lum1, lum2);
    var darkest = min(lum1, lum2);

    /// Calculate the contrast ratio using the following formula.
    double contrast = (brightest + 0.05) / (darkest + 0.05);

    /// AA – This is the sweet spot for text sizes below ~18.6pt.
    /// This is a score of at least 4.5 . AAA – This is enhanced contrast with
    /// a score of at least 7.0 . Think longer form articles that will be read
    /// for a significant period of time.
    ///

    if (wcag == WCAG.AA) {
      if (fontSize <= 18.6) {
        if (contrast >= 4.5)
          isContrast = true;
        else
          isContrast = false;
      } else {
        if (contrast >= 3)
          isContrast = true;
        else
          isContrast = false;
      }
      print("WCAG AA: $isContrast");
    } else {
      if (fontSize <= 18.6) {
        if (contrast >= 7)
          isContrast = true;
        else
          isContrast = false;
      } else {
        if (contrast >= 4.5)
          isContrast = true;
        else
          isContrast = false;
      }
      print("WCAG AAA: $isContrast");
    }

    return isContrast;
  }
}
