import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_app/app.dart';
import 'package:random_color_app/main_page.dart';

Future<void> pumpTestApp(
  WidgetTester tester,
) =>
    tester.pumpWidget(const App());

void main() {
  testWidgets(
    'test that main page with title is displayed when app is launched',
    (WidgetTester tester) async {
      await pumpTestApp(tester);
      expect(MainPageObject.titleFinder, findsOneWidget);
    },
  );

  testWidgets(
    'test that main page change background color when tapped',
    (WidgetTester tester) async {
      await pumpTestApp(tester);
      final initialBackgroundColor = MainPageObject.backgroundColor(tester);
      await MainPageObject().tapOnMainPage(tester);
      expect(
        MainPageObject.backgroundColor(tester),
        isNot(equals(initialBackgroundColor)),
      );
    },
  );
}

class MainPageObject {
  static Finder get scaffoldFinder => find.byType(Scaffold);
  static Finder get titleFinder => find.text('Hello there');

  static Color? backgroundColor(WidgetTester tester) =>
      (tester.firstWidget(scaffoldFinder) as Scaffold).backgroundColor;

  Future<void> tapOnMainPage(WidgetTester tester) async {
    await tester.tap(find.byType(MainPage));
    await tester.pump();
  }
}
