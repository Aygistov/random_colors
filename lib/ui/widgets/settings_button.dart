import 'package:flutter/material.dart';
import 'package:random_colors/ui/widgets/brightness_widget.dart';
import 'package:random_colors/ui/widgets/opacity_widget.dart';
import 'package:random_colors/ui/widgets/saturation_widget.dart';

/// Settings Floating Action Button
class SettingsButton extends StatelessWidget {
  /// Settings Button Constructor
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => settingsDialogBuilder(context),
      child: const Icon(Icons.settings),
    );
  }
}

/// Settings dialog builder
Future<void> settingsDialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext _) {
      return AlertDialog(
        title: const Text('Random color settings'),
        content: Wrap(
          children: [
            OpacityWidget(),
            SaturationWidget(),
            BrightnessWidget(),
          ],
        ),
      );
    },
  );
}
