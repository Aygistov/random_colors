// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:random_colors/random_colors_app.dart';
import 'package:random_colors/ui/view_models/home_viewmodel.dart';
import 'package:random_colors/ui/widgets/home_screen.dart';

const tapsNumber = 10;

void main() {
  testWidgets('Random colors widget test', (WidgetTester tester) async {
    GetIt.instance
        .registerSingleton<HomeViewModel>(HomeViewModel.getInstance());
    await tester.pumpWidget(const RandomColorsApp());

    expect(find.text(greetingText), findsOneWidget);

    final backgroundColors = <Color?>[];
    for (var i = 0; i < tapsNumber; i++) {
      backgroundColors.add(
        (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
      );
      await tester.tapAt(Offset.zero);
      await tester.pump();
    }
    // Let's check that [tapsNumber] random colors are all unique
    expect(backgroundColors.toSet().length, equals(backgroundColors.length));
  });
}
