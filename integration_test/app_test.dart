// ignore_for_file: no_magic_number
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:random_colors/random_colors_app.dart';
import 'package:random_colors/ui/view_models/home_viewmodel.dart';
import 'package:random_colors/ui/widgets/home_screen.dart';

const delayDuration = Duration(milliseconds: 1000);
const tapsNumber = 5;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton<HomeViewModel>(HomeViewModel.getInstance());

  final platformDispatcherView =
      WidgetsBinding.instance.platformDispatcher.views.first;
  final physicalSize = platformDispatcherView.physicalSize;

  final devicePixelRatio = platformDispatcherView.devicePixelRatio;
  final screenHeight = physicalSize.height / devicePixelRatio;
  final screenWidth = physicalSize.width / devicePixelRatio;

  final tapOffsets = [
    Offset(screenWidth * 0.3, screenHeight * 0.3),
    Offset(screenWidth * 0.6, screenHeight * 0.3),
    Offset(screenWidth * 0.3, screenHeight * 0.6),
    Offset(screenWidth * 0.6, screenHeight * 0.6),
    Offset(screenWidth * 0.2, screenHeight * 0.2),
  ];
  Offset getTapOffset(int index) => tapOffsets[index % tapOffsets.length];

  testWidgets('tap on the screen, verify change of background color',
      (tester) async {
    await tester.pumpWidget(const RandomColorsApp());

    expect(find.text(greetingText), findsOneWidget);
    await Future.delayed(delayDuration);

    final backgroundColors = <Color?>[];
    for (var i = 0; i < tapsNumber; i++) {
      backgroundColors.add(
        (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
      );
      await tester.tapAt(getTapOffset(i));
      await tester.pump(delayDuration);
    }
    // Let's check that random colors are all unique
    expect(backgroundColors.toSet().length, equals(backgroundColors.length));
    await Future.delayed(delayDuration);
  });
}
