// We need to have the flutter_test dependecy in pubspec.yaml 's dev_dependencies section
// dev_dependencies are only used for development and testing purposes
// they will be removed when we put the app in production

import 'package:flutter/material.dart';
// flutter_test dependencyshould be imported to use the testWidgets() method
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/main.dart';

// main() method indicated that it is the starting point for this tests
void main() {
  //testWidgets function is used to test multiple widgets at once
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // We need to test these apps without depending on run-time environment like which device or screen size
    // For that we need to have a instance of the app we want to test that does not depend on the run-time environment
    // For that we use tester.pumpWidget() method
    // It will trigger a frame and build the widget by calling the build() method of the widget
    await tester.pumpWidget(const MyApp());

    // Next we need to validate the initial state of the application
    // expect() - we are expecting some value to match to some other value

    // Find a text field that contains the text '0'
    // findsOneWidget - we are expecting to find only one widget with the text '0'
    expect(find.text('0'), findsOneWidget);

    // Find a text field that contains the text '1'
    // findsNothing - we are expecting to find no widget with the text '1'
    expect(find.text('1'), findsNothing);

    // All the functions like that are ...
    // findsWidgets - we are expecting to find multiple widgets
    // findsNWidgets - we are expecting to find a specific number of widgets
    // findsOneWidget - we are expecting to find only one widget
    // findsNothing - we are expecting to find no widget

    // Next we are clicking on the button
    // We are using the tester.tap() method to tap on the button
    // We are using the find.byIcon() method to find the icon widget
    // We are using the Icons.home icon to find the icon widget
    // We are using the await keyword to wait for the tap to complete
    await tester.tap(find.byIcon(Icons.home));
    // We are using the tester.pump() method to trigger a frame
    // It rerenders the app with the new state
    // It will trigger a frame and build the widget by calling the build() method of the widget
    await tester.pump();

    // The application is now rerendered into the new state (The button has been clicked once)
    // We need to erify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Testing for another tap
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();
    expect(find.text('1'),findsNothing);
    expect(find.text('2'), findsOneWidget);

    // tester. - methods that are used to interact with the widgets
  });
}

// This is just a Component / Widget test
// We are not running this in a real device, emulator or a simulator
// Without even having a real device, emulator or a simulator, we are able to test the app using Component / Widget test
// We are running this in a test environment

// If we are running this in a real device, emulator or a simulator, we need to use the end-to-end testing
// We will be deploying the app to a real device, emulator or a simulator
// We will be interacting with the app like a real user

// For widgets that have very simple UI and very simple interaction we can easily use Component / Widget test
// But for complex ones like when we click a button it is doing a background task, HTTP request we need to use end-to-end testing
// (When we are communicating with the outside world , When we have a load involed in )

