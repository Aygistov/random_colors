import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:random_colors/ui/view_models/home_viewmodel.dart';

/// Saturation slider
class SaturationWidget extends StatelessWidget {
  /// Saturation widget constructor
  SaturationWidget({
    super.key,
  });

  final _homeViewModel = GetIt.instance.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Saturation'),
        StreamBuilder<double>(
          stream: _homeViewModel.backgroundColorSaturationStream,
          builder: (_, snapshot) {
            return Slider(
              onChanged: (value) =>
                  _homeViewModel.backgroundColorSaturationSink.add(value),
              value: snapshot.data ?? 0,
            );
          },
        ),
      ],
    );
  }
}
