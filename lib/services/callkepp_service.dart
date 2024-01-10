import 'package:flutter/material.dart';
import 'package:callkeep/callkeep.dart';
import 'package:provider/provider.dart';

import '../provider/call_theme_provider.dart';

void initializeCallKeep(BuildContext context) {
  // Follow CallKeep setup instructions for your platform

  // Handle incoming call events
  CallKeep.on((event) async {
    switch (event.type) {
      case CallKeepPerformAnswerCallAction:
        // Handle answering calls
        break;
      case CallKeepPerformEndCallAction:
        // Handle ending calls
        break;
      case CallKeepDidReceiveStartCallAction:
        // Handle incoming calls
        final provider = Provider.of<CallThemeProvider>(context, listen: false);
        final backgroundImage = provider.selectedBackgroundImage;

        if (backgroundImage.isNotEmpty) {
          try {
            await CallKeep.instance.setBackgroundImage(backgroundImage);
          } catch (error) {
            print('Error setting background image: $error');
          }
        }
        break;
      // Handle other CallKeep events as needed
    }
  });
}
