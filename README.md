# Contrast Checker

A flutter package for checking the text color and the background color contrast.  

## Installation

Add  *contrast_checker*  as a dependency in [your pubspec.yaml file](https://flutter.io/platform-plugins/).
```
contrast_checker: any
```
---

## Android
No permissions required. Uses application cache directory.

## iOS
No permissions required.

## How-to:
```
bool isContrast = contrastCheck(18.6, Color(0xFF6E6E6E), Color(0xFFFFFFFF), WCAG.AA);
```