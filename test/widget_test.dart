import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hello_personalized/main.dart';

void main() {
  testWidgets('fresh hello page shows team members and updates counter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FreshHelloApp());

    expect(find.text('Mane的创新实验 Flutter 首页'), findsOneWidget);
    expect(find.text('成员：吴宣萱、刘丽、李娅、马蝶、雷雅倩'), findsOneWidget);
    expect(find.textContaining('今日已完成任务：0 次'), findsOneWidget);

    await tester.tap(find.widgetWithText(FloatingActionButton, '完成一次打卡'));
    await tester.pump();

    expect(find.textContaining('今日已完成任务：1 次'), findsOneWidget);
  });
}
