// ignore_for_file: no_magic_number
import 'package:flutter_test/flutter_test.dart';
import 'package:random_colors/utils/hsv_to_rgb.dart';

void main() {
  test('HSV to RGB function should work correctly', () {
    expect(hsvToRgb(0, 1, 1), [255, 0, 0]);
    expect(hsvToRgb(0.2, 1, 1), [204, 255, 0]);
    expect(hsvToRgb(0.4, 1, 1), [0, 255, 102]);
    expect(hsvToRgb(0.6, 1, 1), [0, 102, 255]);
    expect(hsvToRgb(0.8, 1, 1), [204, 0, 255]);
    expect(hsvToRgb(1, 1, 1), [255, 0, 0]);
  });
}
