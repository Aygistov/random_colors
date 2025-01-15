import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:random_colors/ui/view_models/home_viewmodel.dart';

/// Opacity slider
class OpacityWidget extends StatelessWidget {
  /// Opacity widget constructor
  OpacityWidget({
    super.key,
  });

  final _homeViewModel = GetIt.instance.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Opacity'),
        StreamBuilder<double>(
          stream: _homeViewModel.backgroundColorOpacityStream,
          builder: (_, snapshot) {
            return Slider(
              onChanged: (value) =>
                  _homeViewModel.backgroundColorOpacitySink.add(value),
              value: snapshot.data ?? 0,
            );
          },
        ),
      ],
    );
  }
}
