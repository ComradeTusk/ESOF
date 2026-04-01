import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_test/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Acceptance Tests', () {
    group('Login Page', () {
      testWidgets('shows login page on startup', (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        expect(find.text('Login'), findsWidgets); // AppBar title + button
        expect(find.byType(TextField), findsNWidgets(2));
        expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
      });
      group('Login flow', () {
        testWidgets('tapping Login navigates to Home Page', (
          WidgetTester tester,
        ) async {
          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();

          await tester.enterText(
            find.widgetWithText(TextField, 'Username'),
            'testuser',
          );
          await tester.enterText(
            find.widgetWithText(TextField, 'Password'),
            'password',
          );
          await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
          await tester.pumpAndSettle();

          expect(find.text('Flutter Demo Home Page'), findsOneWidget);
        });

        testWidgets('Login page is no longer visible after successful login', (
          WidgetTester tester,
        ) async {
          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();

          await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
          await tester.pumpAndSettle();

          // pushReplacement removes the login route entirely
          expect(find.text('Login'), findsNothing);
        });
      });

      group('Logout flow', () {
        Future<void> navigateToHome(WidgetTester tester) async {
          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();
          await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
          await tester.pumpAndSettle();
        }

        testWidgets('tapping logout returns to Login page', (
          WidgetTester tester,
        ) async {
          await navigateToHome(tester);

          await tester.tap(find.byIcon(Icons.logout));
          await tester.pumpAndSettle();

          expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
        });

        testWidgets('Home page is no longer visible after logout', (
          WidgetTester tester,
        ) async {
          await navigateToHome(tester);

          await tester.tap(find.byIcon(Icons.logout));
          await tester.pumpAndSettle();

          expect(find.text('Flutter Demo Home Page'), findsNothing);
        });

        testWidgets('counter resets to 0 after logout and login again', (
          WidgetTester tester,
        ) async {
          await navigateToHome(tester);

          // Increment counter
          await tester.tap(find.byType(FloatingActionButton));
          await tester.pump();
          expect(find.text('1'), findsOneWidget);

          // Logout
          await tester.tap(find.byIcon(Icons.logout));
          await tester.pumpAndSettle();

          // Login again
          await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
          await tester.pumpAndSettle();

          // Fresh instance — counter should be 0
          expect(find.text('0'), findsOneWidget);
        });
      });
    });
  });
}
