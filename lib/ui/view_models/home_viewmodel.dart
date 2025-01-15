import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:random_colors/utils/get_random_color.dart';
import 'package:rxdart/rxdart.dart';

/// default random color opacity
const defaultOpacity = 1.0;

/// default random color saturation
const defaultSaturation = 0.5;

/// default random color brightness
const defaultBrightness = 0.95;

/// Home screen view model
class HomeViewModel {
  final _backgroundColor = BehaviorSubject<Color>();
  final _backgroundColorOpacity = BehaviorSubject.seeded(defaultOpacity);
  final _backgroundColorSaturation = BehaviorSubject.seeded(defaultSaturation);
  final _backgroundColorBrightness = BehaviorSubject.seeded(defaultBrightness);

  final _random = Random();

  /// Stream for background color value
  Stream<Color> get backgroundColorStream => _backgroundColor.stream;

  /// Stream for background color Opacity
  Stream<double> get backgroundColorOpacityStream =>
      _backgroundColorOpacity.stream;

  /// Sink for background color Opacity
  Sink<double> get backgroundColorOpacitySink => _backgroundColorOpacity.sink;

  /// Stream for background color Saturation
  Stream<double> get backgroundColorSaturationStream =>
      _backgroundColorSaturation.stream;

  /// Sink for background color Saturation
  Sink<double> get backgroundColorSaturationSink =>
      _backgroundColorSaturation.sink;

  /// Stream for background color Brightness
  Stream<double> get backgroundColorBrightnessStream =>
      _backgroundColorBrightness.stream;

  /// Sink for background color Brightness
  Sink<double> get backgroundColorBrightnessSink =>
      _backgroundColorBrightness.sink;

  /// Home view model constructor
  HomeViewModel();

  /// Home screen view model factory
  factory HomeViewModel.getInstance() {
    final homeViewModel = HomeViewModel();

    return homeViewModel;
  }

  /// Function that changes the background color of the screen
  void changeBackgroundColor() {
    _backgroundColor.add(
      getRandomColor(
        opacity: _backgroundColorOpacity.value,
        saturation: _backgroundColorSaturation.value,
        brightness: _backgroundColorBrightness.value,
        random: _random,
      ),
    );
  }

  /// Close all subjects
  void dispose() {
    _backgroundColor.close();
    _backgroundColorOpacity.close();
    _backgroundColorSaturation.close();
    _backgroundColorBrightness.close();
  }
}
