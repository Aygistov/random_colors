// ignore_for_file: no_magic_number
/// Convert an HSV color to RGB, where
/// [hue] is specified in normalized degrees [0, 1] (where 1 is 360-degrees);
/// [saturation] and [brightness] are in the range [0, 1].
///
/// Returns a list [r, g, b] with values in the range [0, 255].
///
/// Example:
/// ```dart
/// final rgb = hsvToRgb(0, 1, 1); // [255, 0, 0]
/// ```
List<int> hsvToRgb(num hue, num saturation, num brightness) {
  const maxRange = 255.0;
  if (saturation == 0) {
    final gray = (brightness * maxRange).round();

    return [gray, gray, gray];
  }

  final num h = (hue - hue.floor()) * 6.0;
  final f = h - h.floor();
  final num p = brightness * (1.0 - saturation);
  final num q = brightness * (1.0 - saturation * f);
  final num t = brightness * (1.0 - (saturation * (1.0 - f)));

  switch (h.toInt()) {
    case 0:
      return [
        (brightness * maxRange).round(),
        (t * maxRange).round(),
        (p * maxRange).round(),
      ];
    case 1:
      return [
        (q * maxRange).round(),
        (brightness * maxRange).round(),
        (p * maxRange).round(),
      ];
    case 2:
      return [
        (p * maxRange).round(),
        (brightness * maxRange).round(),
        (t * maxRange).round(),
      ];
    case 3:
      return [
        (p * maxRange).round(),
        (q * maxRange).round(),
        (brightness * maxRange).round(),
      ];
    case 4:
      return [
        (t * maxRange).round(),
        (p * maxRange).round(),
        (brightness * maxRange).round(),
      ];
    case 5:
      return [
        (brightness * maxRange).round(),
        (p * maxRange).round(),
        (q * maxRange).round(),
      ];
    default:
      throw Exception('invalid hue');
  }
}
