
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:callkeep/callkeep.dart';


class CallThemeProvider with ChangeNotifier {
  String selectedBackgroundImage = '';
  List<String> availableImages = [
    'lib/images/001.jpg',
    'lib/images/002.jpg', 
    'lib/images/003.jpg',
    'lib/images/004.jpg',
    'lib/images/005.jpg', 
    'lib/images/006.jpg',
  ];

  void setBackgroundImage(String imagePath) {
    selectedBackgroundImage = imagePath;
    notifyListeners(); // Update UI for any listeners

    // Set the background image for the incoming call using CallKeep
    _setCallKeepBackgroundImage(imagePath);
  }

  void _setCallKeepBackgroundImage(String imagePath) async {
    try {
      if (Platform.isAndroid) {
        await CallKeep.instance.setBackgroundImage(imagePath);
      } else if (Platform.isIOS) {
        // For iOS, you'll need to implement specific code using MethodChannels
        // to set the background image for incoming calls.
        // Use MethodChannels to communicate with native code (Swift/Objective-C)
        // Example:
        // await MethodChannel('your_channel_name').invokeMethod('setIncomingCallBackground', imagePath);
        // This part requires platform-specific implementation in the native code.
        // Consult the callkeep package documentation for iOS implementation details.
      } else {
        throw Exception('Unsupported platform');
      }
    } catch (error) {
      print('Error setting background image: $error');
      // Consider displaying a user-friendly error message or taking alternative actions
    }
  }
}

