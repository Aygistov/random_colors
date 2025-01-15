import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:random_colors/random_colors_app.dart';
import 'package:random_colors/ui/view_models/home_viewmodel.dart';

void main() {
  GetIt.instance.registerSingleton<HomeViewModel>(HomeViewModel.getInstance());
  runApp(const RandomColorsApp());
}
