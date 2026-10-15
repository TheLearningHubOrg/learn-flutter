import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const LearnFlutterApp());

    // Verify initial counter is 0
    expect(find.text('0'), findsOneWidget);

    // Tap the '+ Increment' button
    await tester.tap(find.text('+ Increment'));
    await tester.pump();

    // Verify counter incremented to 1
    expect(find.text('1'), findsOneWidget);
  });
}
