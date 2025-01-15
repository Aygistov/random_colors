import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:random_colors/ui/view_models/home_viewmodel.dart';

/// Brightness slider
class BrightnessWidget extends StatelessWidget {
  /// Brightness widget constructor
  BrightnessWidget({
    super.key,
  });

  final _homeViewModel = GetIt.instance.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Brightness'),
        StreamBuilder<double>(
          stream: _homeViewModel.backgroundColorBrightnessStream,
          builder: (_, snapshot) {
            return Slider(
              onChanged: (value) =>
                  _homeViewModel.backgroundColorBrightnessSink.add(value),
              value: snapshot.data ?? 0,
            );
          },
        ),
      ],
    );
  }
}
