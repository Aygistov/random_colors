import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:random_colors/ui/view_models/home_viewmodel.dart';
import 'package:random_colors/ui/widgets/settings_button.dart';

/// Text that is displayed in the center of the screen
const greetingText = 'Hey there';

/// Home screen widget
class HomeScreen extends StatelessWidget {
  /// Home screen widget constructor
  HomeScreen({super.key});

  final _homeViewModel = GetIt.instance.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _homeViewModel.changeBackgroundColor,
      child: StreamBuilder<Color>(
        stream: _homeViewModel.backgroundColorStream,
        builder: (_, snapshot) {
          return Scaffold(
            backgroundColor: snapshot.data,
            floatingActionButton: const SettingsButton(),
            body: const Center(child: Text(greetingText)),
          );
        },
      ),
    );
  }
}
