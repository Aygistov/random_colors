import 'dart:math';
import 'dart:ui';

import 'package:random_colors/utils/hsv_to_rgb.dart';

/// Function that returns a random color with optional parameters:
/// [opacity], [saturation] and [brightness]
Color getRandomColor({
  required double opacity,
  required double saturation,
  required double brightness,
  required Random random,
}) {
  final rgb = hsvToRgb(random.nextDouble(), saturation, brightness);

  // ignore: prefer_first
  return Color.fromRGBO(rgb[0], rgb[1], rgb[2], opacity);
}
