import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hello_personalized/main.dart';

void main() {
  testWidgets('personalized task page updates counter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const InnovationHelloApp());

    expect(find.text('吴宣萱的创新实验 Flutter 首页'), findsOneWidget);
    expect(find.text('姓名：吴宣萱'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    final completeButton = find.widgetWithText(FilledButton, '完成一次打卡');
    await tester.ensureVisible(completeButton);
    await tester.pumpAndSettle();
    await tester.tap(completeButton);
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    final resetButton = find.widgetWithText(OutlinedButton, '重新开始');
    await tester.ensureVisible(resetButton);
    await tester.pumpAndSettle();
    await tester.tap(resetButton);
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}
