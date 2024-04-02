// For the integration_tests it is a good practice to create a seperate directory and a file
// We need to have the integration_tests dependecy in pubspec.yaml 's dev_dependencies section
// dev_dependencies are only used for development and testing purposes
// they will be removed when we put the app in production

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing/main.dart';

void main() {
  // We will be runnig these test with a real, emulated or simulated device
  // For that we need to use the IntegrationTestWidgetsFlutterBinding.ensureInitialized() method
  // It will initialize the application for testing
  // It will make sure that the application is launched, and it is loaded, and make sure application is ready for testing.
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    // Says what sort of simmilar tests we will be executing here
    // We can group them by there functionality, or by the page they are testing etc.
    group('e2e tests on the main page', () { 
        testWidgets('verify the counter', (tester) async  {
          // Creates the widget and calls the build() method of the widget
          // await - waits for the widget to be built
          await tester.pumpWidget(const MyApp());

          expect(find.text('0'), findsOneWidget);

          // We can give a delays for demonstartion purposes
          await Future.delayed(const Duration(seconds: 2));

          await tester.tap(find.byIcon(Icons.home));
          // Here we use pumpAndSettle() method to wait for the animation to complete
          // It's like the pump() method in the widget tests
          await tester.pumpAndSettle();

          // We can give a delay for demonstartion purposes
          await Future.delayed(const Duration(seconds: 2));

          expect(find.text('1'), findsOneWidget);

        });
    });
  }

  // Widget test and integration test code looks simmilar

  // Widget tests or unit tests are used to test a single widget or a single function
  // Integration tests or end-to-end tests are used to test the whole application

  // Widget tests are faster than integration tests

  // End-to-end tests runs on a real device, emulator or simulator
  // Some device or versions of devices may run the code with no issues, but some devices may have issues
  // So identify these issues we need to run integration tests on multiple devices and mulitple versions of devices

  // Also to test UI elements and their responsiveness (resolutions, sizes, and positions) ...
  // ... we need to run integration tests on multiple devices and mulitple versions of devices
  // Widget tests are not capable of doing that

  // Because integration tests are slower than widget tests, we should run them less frequently and only when necessary (like when you wanna test a flow of the app)
  // We should run widget tests more frequently (About 60-70% test should be widget tests and 30-40% should be integration tests)
  // To keep the balance between the two types of tests

