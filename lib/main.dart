import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/provider/call_theme_provider.dart';
import 'package:flutter_caller_theme_01/screens/call_theme_page.dart';
import 'package:flutter_caller_theme_01/services/callkepp_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CallThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize CallKeep
    initializeCallKeep(context); // Pass context here

    return MaterialApp(
      title: 'Call Theme App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CallThemePage(), // Set CallThemePage as home
      onGenerateRoute: (settings) {
        // Handle incoming call routes
        if (settings.name == '/incoming-call') {
          final arguments = settings.arguments as Map<String, dynamic>;
          final callerId = arguments['callerId'];
          return MaterialPageRoute(builder: (context) => CallThemePage(callerId: callerId));
        }

        // Default route for settings page
        return MaterialPageRoute(builder: (context) => CallThemePage());
      },
    );
  }
}
