import 'package:flutter/material.dart';
import '../screens/call_theme_page.dart';
import '../provider/call_theme_provider.dart';
import '../services/callkeep_service.dart'; // Import your callkeep service here

void handleIncomingCall(BuildContext context, String callerId) {
  // Fetch caller details (optional using contacts_service)
  String callerName = 'Unknown1'; // Replace with fetched name
  String callerImage = 'lib/images/001.jpg'; // Replace with fetched image

  // Retrieve selected background image from provider
  final provider = Provider.of<CallThemeProvider>(context, listen: false);
  final backgroundImage = provider.selectedBackgroundImage;

  // Display custom call screen
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => CallThemePage(
      callerName: callerName,
      callerImage: callerImage,
      backgroundImage: backgroundImage, // Pass the background image
    ),
  );

  // Set the background image for system incoming calls using callkeep_service.dart
  setSystemIncomingCallBackground(backgroundImage); // Update this with your implementation
}

void setSystemIncomingCallBackground(String backgroundImage) {
  // Implement code to set the background image for system incoming calls
  // Use your implementation from callkeep_service.dart or the required logic/package
  // For example, if you're using CallKeep, call its method to set the background image.
  // For other methods or platform-specific code, use the appropriate approach.
  // Example (if using CallKeep):
  // initializeCallKeep(context); // Initialize CallKeep in your app
  // await CallKeep.instance.setBackgroundImage(backgroundImage);
}
